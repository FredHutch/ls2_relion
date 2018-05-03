#!/bin/bash

curl -s -L https://nvidia.github.io/nvidia-docker/amzn2/nvidia-docker.repo | sudo tee /etc/yum.repos.d/nvidia-docker.repo

sudo yum install -y nvidia-docker2 xorg-x11-xauth
