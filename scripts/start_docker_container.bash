#!/bin/bash
# This script start the docker container

echo -e "Starting container image ubuntu18.04:ros"
read -p "Container name: " CONTAINERNAME

docker run -d -ti -v $(pwd)/..:/root/docker_mount --name $CONTAINERNAME --cap-add=SYS_PTRACE ubuntu18.04:ros
