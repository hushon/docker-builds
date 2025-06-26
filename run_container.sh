#!/bin/bash
# usage: sh run_container.sh <CONTAINER_NAME> <IMAGE>
CONTAINER_NAME=$1
IMAGE=$2
docker run -it \
--gpus all \
--volume /home/:/home/ \
--workdir /workspace/ \
--volume /mnt/:/mnt/ \
--ipc=host \
--name $CONTAINER_NAME \
--shm-size 8G \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=$DISPLAY \
-v $HOME/.Xauthority:/root/.Xauthority:rw \
$IMAGE
