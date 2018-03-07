# ls2_relion
RELION container for docker

## Use Notes
1. Start an EC2 instance running ami-d18f2ba9
1. Follow tutorial on installing nvidia-docker linked below
1. ssh (with X forwarding) to the instance as user `ec2-user`
1. Start with:
> sudo docker run -ti --rm --net=host -e DISPLAY=$DISPLAY -v /home/ec2-user/.Xauthority:/home/neo/.Xauthority --name relion1 fredhutch/ls2-relion:2.1 <command>
1. Command `/usr/local/relion` will start relion directly
1. Command `/bin/bash -l` will start a shell in the container

## Build Notes
Software included based on Relion 2.1 tutorial [here](ftp://ftp.mrc-lmb.cam.ac.uk/pub/scheres/relion21_tutorial.pdf):

* Relion 2.1
* MotionCor2
* Gctf
* ctffind
* ResMap
* Chimera

We then added CCP4 to satisfy a local request for it.

The container is tested on an EC2 instance running this AMI:

> Deep Learning AMI with Source Code Amazon Linux v2.0 (ami-d18f2ba9)

Following direction from [here](https://docs.aws.amazon.com/batch/latest/userguide/batch-gpu-ami.html).

The work to be done on the AMI includes:

* install nvidia-docker
* add start script to start nvidia-docker-plugin on boot

The container has a USER (UID 500) called 'neo' with a home directory (/home/neo) that can be mounted as a volume in the container to allow easy data transfer, etc... .
[Note that ec2-user is also UID 500.]

## Detailed notes (boring)
OS packages installed and why:
* curl - get sources
* build-essential - build sources
* cmake - build sources
* libopenmpi-dev - required by relion
* libfftw3-3 - required by relion or MotionCor (I don't remember)
* libx11-dev - required by relion
* ghostscript - required by MotionCor (pretty sure)
* libxrender1 - required by CCP4

OS packages removed during docker build:
* build-essential
* cmake

Non-OS packages installed and why:
* libtiff3 - required by MotionCor

Sources:
* MotionCor2 is a manual download and small, so it is copied locally
* libtiff3 is downloaded from public site
* Gctf is downloaded from public site
* ResMap is downloaded from public site
* Chimera is downloaded from public site
* relion is downloaded from public site
* CCP4 is a manual download and big, so it is downloaded from a public S3 URL
