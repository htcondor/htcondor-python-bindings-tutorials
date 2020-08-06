#!/usr/bin/env bash

set -e

CONTAINER_TAG=htcondor-python-bindings-tutorials

echo "Building HTCondor Python Bindings Tutorials container..."

docker pull htcondor/htc-minimal-notebook:latest
docker build -t ${CONTAINER_TAG} --file binder/Dockerfile .
docker run -it --rm --mount type=bind,source="$(pwd)"/tutorials,target=/home/jovyan/tutorials ${CONTAINER_TAG} -- bash -lc "find_notebooks | xargs nbstripout"
