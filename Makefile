.PHONY: build rebuild up down shell login clean

# Build the docker image
build:
	docker-compose build

# Rebuild the docker image from scratch (no cache)
rebuild:
	docker-compose build --no-cache

# Start the container in background
up:
	docker-compose up -d

# Stop and remove the container
down:
	docker-compose down

# Enter the container shell (automatically builds if Dockerfile changed)
shell:
	docker-compose run --rm --build --name tf-dev-shell terraform

# Login to an already running container
login:
	docker exec -it tf-dev-env bash

# Clean up docker volumes (resets credentials and state)
clean:
	docker-compose down -v
