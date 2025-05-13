# Use the lightweight Alpine Linux image as the base
FROM alpine:latest

RUN apk update --no-cache && \
    apk upgrade --no-cache
    
CMD ["echo", "Hello, World! This is a lightweight Docker image based on Alpine."]
