#!/bin/bash
# This script connect thsi terminal to specify docker container

# Obtain container name
read -p "Container name to be connected: " CONTAINERNAME

docker exec -ti $CONTAINERNAME bash