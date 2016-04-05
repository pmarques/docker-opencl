# docker build -t nvidia_opencl .

FROM ubuntu:14.04

MAINTAINER Mario David <mariojmdavid@gmail.com>

#RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list && \
#    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list && \
#    echo "deb http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list

RUN locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get install -y \
        build-essential \
        software-properties-common \
        tar \
        wget

RUN mkdir -p /tmp/cuda && \
    cd /tmp/cuda && \
    wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run && \
    chmod 700 * && \
    ./cuda_7.5.18_linux.run --silent  --extract=/tmp/cuda && \
    chmod 700 *



#RUN /tmp/opencl/NVIDIA-Linux-x86_64-352.39.run -s --no-kernel-module
#RUN cp -prv /tmp/opencl/include/CL /usr/include/
#RUN cp -prv /tmp/opencl/lib64/* /usr/lib/
#RUN mkdir -p /etc/OpenCL/vendors/ && \
#    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
#RUN rm -rf /tmp/opencl

