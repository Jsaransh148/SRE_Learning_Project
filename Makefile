# Name of the Docker image
IMAGE_NAME := petstore

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container in detached mode
run:
	docker run -d -p 8443:8080 $(IMAGE_NAME)

# Stop and remove the running container
stop:
	docker stop $(container_id)
	docker rm $(container_id)

# Find the container ID
container_id:
	docker ps -aqf "name=$(IMAGE_NAME)"

# Clean up all images and containers
clean:
	docker stop $(shell docker ps -aq)
	docker rm $(shell docker ps -aq)
	docker rmi $(IMAGE_NAME) -f

# Run tests (replace with your actual test command)
test:
	pytest

.PHONY: build run stop clean test
