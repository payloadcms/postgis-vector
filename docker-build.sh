#!/usr/bin/env bash

docker buildx create --name multiarch-builder --use

docker buildx build \
  --platform=linux/arm64 \
  --build-arg TARGETARCH=arm64 \
  --build-arg TARGETPLATFORM=linux/arm64 \
  --load \
  -t pgvectortest \
  .

