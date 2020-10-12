# Docker Ubuntu 18.04 ROS Melodic

This repository stores the information of setting up basic ROS on Ubuntu to be used in docker.  

## Building the Dockerfile

Build the dockerfile inside the `docker_build` directory.  
```bash
cd docker_build
docker build -t ubuntu18.04:ros .
```

## Viewing Docker images

Run the following commands to see if the image is correctly built.  
```bash
docker images
# Output
# REPOSITORY          TAG                    IMAGE ID            CREATED             SIZE
# ubuntu18.04         ros                    7f732da32ca9        5 minutes ago       3.03GB
# osrf/ros            melodic-desktop-full   a198f2b70877        10 days ago         2.75GB
```

## Starting the Container

Run the `start_docker_container.bash` inside the `scripts` directory.  
It will automatically start the `ubuntu18.04:ros` image container.  
Please provide a name to the newly started container.  
```bash
cd scripts
./start_docker_container.bash
# Provide a name
# Starting container image ubuntu18.04:ros
# Container name: my_container
```

## Connecting to the Container

Run the `connect_docker_container.bash` inside the `scripts` directory.  
Please provide the name of container you wish to connect to.  
```bash
cd scripts
./connect_docker_container.bash
# Provide a name
# Container name to be connected: my_container
```

## A Word from Author

Enjoy your ROS Ubuntu in a docker container. Please look at other branches for your favourite Ubuntu Version.  

## Reference

- [link1](https://jarisafi.wordpress.com/2018/01/17/how-i-use-docker-for-robotics-development/) [link2](https://stackoverflow.com/questions/33493456/docker-bash-prompt-does-not-display-color-output) [link3](https://gist.github.com/robsonke/c5c478bae476adb32d48)
