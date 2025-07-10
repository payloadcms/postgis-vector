#!/usr/bin/env bash

# Stop existing container if it exists
docker rm -f pgvectortest || true && \
# Run new container
docker run --rm \
  --name pgvectortest \
  -e POSTGRES_USER=devuser \
  -e POSTGRES_PASSWORD=devpassword \
  -e POSTGRES_DB=mydb \
  -e PAYLOAD_DATABASE=postgres \
  -p 5433:5432 \
  pgvectortest:latest
