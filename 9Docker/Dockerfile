FROM ubuntu
RUN apt-get update && apt-get install -y \
	curl \
	&& rm -rf /var/lib/apt/lists/*

CMD ["echo", "Hello, World!"]

# This Dockerfile creates a simple Ubuntu-based container that prints "Hello, World!" when run.
# To build the Docker image, use the command:
# docker build -t hello-world-image .
# To run the Docker container, use the command:
# docker run hello-world-image