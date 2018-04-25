# ls2_relion
Docker container to run Relion 2.1.

The container has Relion and support programs included (see Dockerfile for details).

## Helper scripts

`prepare_ec2.sh` adds the OS packages needed to run nvidia-docker on the Deep Learning with Source AMI
`down_relion_tutorial.sh` will download the Relion 2.1 Tutorial dataset into `relion21_tutorial`
`start_contianer.sh` is meant to automated starting the Docker container on a host - it is built for `nvidia-docker` right now so may need to be changed if you are not using `nvidia-docker`
`run_relion` is meant to help users simply run Relion - it can be run with `ssh -t` remotely

## AWS Setup
We are running this container on a p2.xlarge AWS instance using the Deep Learning with Source AMI and nvidia-docker.
