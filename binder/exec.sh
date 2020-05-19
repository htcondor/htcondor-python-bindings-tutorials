#!/usr/bin/env bash

set -e

CONTAINER_TAG=htcondor-python-bindings-tutorials

echo "Building HTCondor Python Bindings Tutorials container..."

docker build -t ${CONTAINER_TAG} --file binder/Dockerfile .
docker run --rm --mount type=bind,source="$(pwd)"/tutorials,target=/home/jovyan/tutorials ${CONTAINER_TAG} -- bash -l -c 'sleep 5 && condor_who -wait:60 "IsReady && STARTD_State =?= \"Ready\"" && for x in $(find_notebooks); do jupyter nbconvert --to notebook --inplace --execute --allow-errors --ExecutePreprocessor.timeout=None $x && condor_rm --all ; done'
