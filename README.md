# ls2_relion
RELION container for docker

## How to Use
The container has relion and support programs included (see Dockerfile for details).

You should gather your data separately.

Invoke the container with the start_container.sh script. This will start a bash shell in the contaaner, and start the container if it is not running.

## AWS Setup
We are running this container on a p2.xlarge AWS instance using the Deep Learning with Source AMI and nvidia-docker.

Use the script 'prepare_ec2.sh' to install requirements onto new EC2 instances.

Use the script 'download_relion_tutorial.sh' to download the Relion 2.1 tutorial PDF and dataset.
