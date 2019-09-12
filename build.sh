#!/bin/bash
CONTAINER_NAME=labrador

BASEDIR="$(dirname "$BASH_SOURCE")"

cd $BASEDIR

docker-compose up -d

echo Waiting for container $CONTAINER_NAME...
until [[ $(docker inspect -f {{.State.Running}} $CONTAINER_NAME) == "true" ]]; do
    sleep 0.5;
done;
clear

docker exec -it $CONTAINER_NAME bash -c "cd labrador-linux && make"
