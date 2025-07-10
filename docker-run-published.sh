#!/usr/bin/env bash

docker pull ghcr.io/payloadcms/postgis-vector:latest && \
# Stop existing container if it exists
docker rm -f postgis-vector || true && \
# Run new container
docker run --rm \
  --name postgis-vector \
  -e POSTGRES_USER=devuser \
  -e POSTGRES_PASSWORD=devpassword \
  -e POSTGRES_DB=mydb \
  -e PAYLOAD_DATABASE=postgres \
  -p 5433:5432 \
  ghcr.io/payloadcms/postgis-vector:latest