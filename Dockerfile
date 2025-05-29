# Stage 1: Builder - creates a dummy Node app
FROM node:24-alpine AS builder

WORKDIR /app

# Create a dummy package.json and index.js
RUN echo '{ "name": "dummy-app", "version": "1.0.0", "main": "index.js" }' > package.json && \
    echo 'console.log("Hello from Node.js");' > index.js

# Install dependencies (none right now)
RUN npm install

# Stage 2: Runtime - lightweight Alpine with Node.js installed
FROM alpine:latest

# Install Node.js and npm
RUN apk add --no-cache nodejs npm

WORKDIR /app

# Copy built app from builder stage
COPY --from=builder /app .

# Set default command
CMD ["node", "index.js"]
