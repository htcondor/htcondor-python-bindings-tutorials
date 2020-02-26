@echo off

SET CONTAINER_TAG=htcondor-python-bindings-tutorials

echo "Building HTCondor Python Bindings Tutorials container..."

docker build -t %CONTAINER_TAG% --file binder/Dockerfile .

docker run -it --rm -p 8888:8888 %CONTAINER_TAG%
