#!/usr/bin/env bash

# This script just runs the latest published image and does not build it locally.

docker pull ghcr.io/payloadcms/postgis-vector:latest && docker run --rm \
  -e POSTGRES_USER=devuser \
  -e POSTGRES_PASSWORD=devpassword \
  -e POSTGRES_DB=mydb \
  -e PAYLOAD_DATABASE=postgres \
  -p 5433:5432 \
  ghcr.io/payloadcms/postgis-vector:latest
