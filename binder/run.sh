#!/usr/bin/env bash

set -e

CONTAINER_TAG=htmap-binder-run

echo "Building HTCondor Tutorials Binder container..."

docker build -t ${CONTAINER_TAG} --file binder/Dockerfile .
docker run -it --rm -p 8888:8888 ${CONTAINER_TAG} $@
