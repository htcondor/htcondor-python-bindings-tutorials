#!/usr/bin/env bash

set -e

CONTAINER_TAG=htcondor-python-bindings-tutorials

echo "Building HTCondor Python Bindings Tutorials container..."

docker build -t ${CONTAINER_TAG} --file binder/Dockerfile .
docker run -it --rm --mount type=bind,source="$(pwd)"/tutorials,target=/home/jovyan/tutorials ${CONTAINER_TAG} -- bash -l -c "find_notebooks | xargs jupyter nbconvert --to notebook --inplace --execute --allow-errors"
