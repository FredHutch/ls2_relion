#!/bin/bash

# meant to be placed in the users' home directory
# starts a new container or execs a new shell in a running container

# the docker executable
docker_cmd="nvidia-docker"

# I use sudo, you may not
sudo="sudo"

# the image to use
relion_container_img="fredhutch/ls2-relion:2.1"

function connect_container() {
  $sudo $docker_cmd exec -ti \
    relion1 /bin/bash
}

function start_container() {
  $sudo $docker_cmd run -ti --rm \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -e LD_LIBRARY_PATH=/usr/local/lib \
    -v $CWD:/home/neo \
    --name relion1 $relion_container_img /bin/bash -i
}

# check for running container
$sudo $docker_cmd ps | grep -q relion1

if [ "$?" -eq "0" ]
then
  connect_container
else
  start_container
fi
