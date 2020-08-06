#!/usr/bin/env bash

set -e

CONTAINER_TAG=htcondor-python-bindings-tutorials

echo "Building HTCondor Python Bindings Tutorials container..."

docker pull htcondor/htc-minimal-notebook:latest
docker build -t ${CONTAINER_TAG} --file binder/Dockerfile .
docker run -it --rm -p 8888:8888 ${CONTAINER_TAG} $@
