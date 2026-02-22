.PHONY: help build rebuild up down shell login clean fmt validate lint init plan apply destroy

# Configuration variables
ENV ?= dev
# Allow overriding the base directory if needed
BASE_DIR ?= base_config/environments
TF_DIR = $(BASE_DIR)/$(ENV)

# Docker Compose command prefix
DOCKER_RUN = docker-compose run --rm terraform bash -c

# Help command (self-documented)
help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

## Docker operations
build: ## Build the docker image
	docker-compose build

rebuild: ## Rebuild the docker image from scratch (no cache)
	docker-compose build --no-cache

up: ## Start the container in background
	docker-compose up -d

down: ## Stop and remove the container
	docker-compose down

shell: ## Enter the container shell (builds if Dockerfile changed)
	docker-compose run --rm --build --name tf-dev-shell terraform

login: ## Login to an already running container
	docker exec -it tf-dev-env bash

clean: ## Clean up docker volumes (resets credentials and state)
	docker-compose down -v

## Terraform operations (run inside container)
init: ## Initialize terraform for the selected environment (e.g., make init ENV=dev)
	$(DOCKER_RUN) "cd $(TF_DIR) && terraform init"

plan: ## Show plan for the selected environment (e.g., make plan ENV=dev)
	$(DOCKER_RUN) "cd $(TF_DIR) && terraform plan"

apply: ## Apply for the selected environment (e.g., make apply ENV=dev)
	$(DOCKER_RUN) "cd $(TF_DIR) && terraform apply -auto-approve"

destroy: ## Destroy for the selected environment (e.g., make destroy ENV=dev)
	$(DOCKER_RUN) "cd $(TF_DIR) && terraform destroy -auto-approve"

## Quality, Security and Documentation
fmt: ## Run terraform fmt recursively on all files
	$(DOCKER_RUN) "terraform fmt -recursive"

validate: ## Run terraform validate for the selected environment
	$(DOCKER_RUN) "cd $(TF_DIR) && terraform validate"

lint: ## Run all pre-commit hooks (TFLint, Checkov, Docs, fmt, etc)
	$(DOCKER_RUN) "pre-commit run --all-files"

checkov: ## Run Checkov security scan on all terraform files
	$(DOCKER_RUN) "checkov -d . --quiet --compact"

docs: ## Generate/Update README.md for all modules using terraform-docs
	$(DOCKER_RUN) "find base_config/modules -maxdepth 1 -mindepth 1 -type d -exec terraform-docs markdown table --output-file README.md {} \;"
