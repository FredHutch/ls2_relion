FROM fredhutch/fredhutch-ubuntu:16.04-20171009

ENV DEBIAN_FRONTEND noninteractive

# OS packages for building
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    libopenmpi-dev

# house keeping
RUN mkdir /software_pkgs
WORKDIR /software_pkgs

# get CUDA
RUN curl -o cuda-repo-ubuntu1604_8.0.61-1_amd64.deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
RUN apt-get update && apt-get install -y --allow-unauthenticated cuda

# get relion
RUN curl -L -o relion-2.1.tar.gz https://github.com/3dem/relion/archive/2.1.tar.gz
RUN tar -xvzf relion-2.1.tar.gz
RUN cd relion-2.1 && mkdir build && cd build && cmake .. && make && make install

# get MotionCor2
# install from local file as download requires form completion
COPY packages/MotionCor2-1.0.4.tar.gz /
RUN cd /usr/local/bin && tar -xvzf /MotionCor2-1.0.4.tar.gz MotionCor2_1.0.4

# get Gctf - dir and files are named differently...?
RUN curl -o Gctf-v1.18_sm_30_cu8.0_x86_64 https://www.mrc-lmb.cam.ac.uk/kzhang/Gctf/Gctf_v1.08/Gctf-v1.18_sm_30_cu8.0_x86_64
RUN cp Gctf-v1.18_sm_30_cu8.0_x86_64 /usr/local/bin/

# get ResMap (using deb to pull dependencies)
RUN curl -L -o ResMap-1.1.4-linux64 https://downloads.sourceforge.net/project/resmap/ResMap-1.1.4-linux64
RUN cp ResMap-1.1.4-linux64 /usr/local/bin/

# set up our user
RUN useradd -ms /bin/bash neo
USER neo
WORKDIR /home/neo
SHELL ["/bin/bash", "-c"]

