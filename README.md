# ls2_relion

Docker container to run Relion 2.1.

The container has Relion and support programs included (see Dockerfile for details).

## Info

Inside the container the default user is 'neo' and has UID 500 to line up with 'ec2-user' in EC2. In order for X to work, the user's home directory is mapped into the container as neo's home directory. You may have issues with different UID. In this case, take a look at the `run_relion` script, which works for multiple users.

The docker version is set to `nvidia-docker` by default, to help ease the use of cuda in the container.

## Helper scripts

`prepare_ec2.sh` adds the OS packages needed to run nvidia-docker on the Deep Learning with Source AMI

`down_relion_tutorial.sh` will download the Relion 2.1 Tutorial dataset into `relion21_tutorial`

`start_contianer.sh` is meant to automated starting the Docker container on a host - it is built for `nvidia-docker` right now so may need to be changed if you are not using `nvidia-docker`

`run_relion` is meant to help users simply run Relion - it can be run with `ssh -t` remotely

## AWS Setup
We are running this container on a p2.xlarge AWS instance using the Deep Learning with Source AMI and nvidia-docker.
