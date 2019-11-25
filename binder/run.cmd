@echo off

SET CONTAINER_TAG=htmap-binder-run

ECHO Building HTCondor Tutorials Binder container...

docker build -t %CONTAINER_TAG% --file binder/Dockerfile .

docker run -it --rm -p 8888:8888 %CONTAINER_TAG%
