@echo off

SET CONTAINER_TAG=htmap-binder-edit

ECHO Building HTCondor Tutorials Binder container...

docker build -t %CONTAINER_TAG% --file binder/Dockerfile .

docker run -it --rm -p 8888:8888 --mount type=bind,source="%CD%",target=/home/jovyan/tutorials %CONTAINER_TAG%
