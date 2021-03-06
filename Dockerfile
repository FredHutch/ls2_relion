FROM nvidia/cuda:9.0-runtime-ubuntu16.04

# OS packages for building
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y && apt-get install -y \
    curl \
    build-essential \
    cmake \
    libopenmpi-dev \
    libfftw3-3 \
    libx11-dev \
    ghostscript \
    libxrender1 \
    csh \
    xterm \
    joe \
    unzip \
    gnuplot \
    tk

# get CUDA
#RUN curl -o cuda-repo-ubuntu1604_8.0.61-1_amd64.deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
#RUN dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
#RUN apt-get update && apt-get install -y --allow-unauthenticated cuda

# get relion
RUN curl -L -o relion-2.1.tar.gz https://github.com/3dem/relion/archive/2.1.tar.gz
RUN tar -xvzf relion-2.1.tar.gz
RUN cd relion-2.1 && mkdir build && cd build && cmake .. && make && make install

# get MotionCor2
# install from local file as download requires form completion
COPY MotionCor2_1.1.0-Cuda90 /usr/local/bin/ 
RUN chmod +x /usr/local/bin/MotionCor2_1.1.0-Cuda90

# install libtiff 3 and clean up
RUN curl -o tiff-3.9.7.tar.gz http://download.osgeo.org/libtiff/tiff-3.9.7.tar.gz && \
    tar -xvzf tiff-3.9.7.tar.gz && \
    cd tiff-3.9.7 && \
    ./configure --prefix=/usr/local && \
    make && \
    make install && \
    cd .. && \
    rm -r tiff-3.9.7 

# get Gctf - dir and files are named differently...?
RUN curl -o Gctf-v1.18_sm_30_cu8.0_x86_64 https://www.mrc-lmb.cam.ac.uk/kzhang/Gctf/Gctf_v1.08/Gctf-v1.18_sm_30_cu8.0_x86_64 && \
    cp Gctf-v1.18_sm_30_cu8.0_x86_64 /usr/local/bin/ && \
    chmod +x /usr/local/bin/Gctf-v1.18_sm_30_cu8.0_x86_64

# get ctffind as Gctf apparently doesn't work with the tutorial data set
RUN cd / \
    && curl -o ctffind-4.1.8-linux64.tar.gz http://grigoriefflab.janelia.org/sites/default/files/ctffind-4.1.8-linux64.tar.gz \
    && cd /usr/local \
    && tar -xvzf /ctffind-4.1.8-linux64.tar.gz

# get unblur
RUN curl -o unblur_1.0.2.tar.gz http://grigoriefflab.janelia.org/sites/default/files/unblur_1.0.2.tar.gz \ 
    && cd /usr/local/bin \
    && tar -xzf /unblur_1.0.2.tar.gz --strip-components=2 unblur_1.0.2/bin/unblur_openmp_7_17_15.exe 

# get summovies
RUN curl -o summovie_1.0.2.tar.gz http://grigoriefflab.janelia.org/sites/default/files/summovie_1.0.2.tar.gz \
    && cd /usr/local/bin \
    && tar -xzf /summovie_1.0.2.tar.gz --strip-components=2 --no-same-owner summovie_1.0.2/bin/sum_movie_openmp_7_17_15.exe

# get ResMap (using deb to pull dependencies)
RUN curl -L -o /usr/local/bin/ResMap-1.1.4-linux64 https://downloads.sourceforge.net/project/resmap/ResMap-1.1.4-linux64 && \
    chmod +x /usr/local/bin/ResMap-1.1.4-linux64

# set up our user
RUN useradd -u 500 -ms /bin/bash neo
USER neo
WORKDIR /home/neo
SHELL ["/bin/bash", "-c"]

