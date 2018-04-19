#!/bin/bash

function connect_container() {
  sudo nvidia-docker exec -ti \
    relion1 /bin/bash
}

function start_container() {
  sudo nvidia-docker run -ti --rm \
    --net=host \
    -e DISPLAY=$DISPLAY \
    -e LD_LIBRARY_PATH=/usr/local/lib \
    -v /home/ec2-user:/home/neo \
    --name relion1 fredhutch/ls2-relion:2.1 /bin/bash -i
}

sudo nvidia-docker ps | grep -q relion1

if [[ "$?" -eq "0" ]]
then
  connect_container
else
  start_container
fi
