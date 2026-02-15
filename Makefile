.PHONY: build up down shell clean

# Build the docker image
build:
	docker-compose build

# Start the container in background
up:
	docker-compose up -d

# Stop and remove the container
down:
	docker-compose down

# Enter the container shell (creates a new one)

shell:

	docker-compose run --rm --name tf-dev-shell terraform



# Login to an already running container

login:

	docker exec -it tf-dev-env bash



# Clean up docker volumes

 (resets credentials and state)
clean:
	docker-compose down -v
