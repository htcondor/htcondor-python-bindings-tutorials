#!/usr/bin/env bash

set -e

CONTAINER_TAG=htcondor-python-bindings-tutorials

echo "Building HTCondor Tutorials Binder container..."

docker build -t ${CONTAINER_TAG} --file binder/Dockerfile .
docker run -it --rm -p 8888:8888 --mount type=bind,source="$(pwd)"/tutorials,target=/home/jovyan/tutorials ${CONTAINER_TAG} $@
