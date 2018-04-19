# ls2_relion
RELION container for docker

## How to Use
The container has relion and support programs included (see Dockerfile for details).

You should gather your data separately.

Invoke the container with the start_container.sh script. This will start a bash shell in the contaaner, and start the container if it is not running.

## AWS Setup
We are running this container on a p2.xlarge AWS instance using the Deep Learning with Source AMI and nvidia-docker.
