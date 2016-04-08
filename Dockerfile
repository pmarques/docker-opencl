# docker build -t nvidia_opencl .

FROM ubuntu:14.04

MAINTAINER Mario David <mariojmdavid@gmail.com>

#RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list && \
#    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list && \
#    echo "deb http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list

RUN locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        software-properties-common \
        wget

RUN mkdir -p /tmp/opencl && \
    cd /tmp/opencl && \
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/nvidia-libopencl1-352_352.79-0ubuntu1_amd64.deb && \
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/nvidia-opencl-icd-352_352.79-0ubuntu1_amd64.deb && \
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/nvidia-352_352.79-0ubuntu1_amd64.deb && \
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/nvidia-352-dev_352.79-0ubuntu1_amd64.deb && \
    dpkg -i nvidia-libopencl1-352_352.79-0ubuntu1_amd64.deb && \
    dpkg -i nvidia-opencl-icd-352_352.79-0ubuntu1_amd64.deb && \
    dpkg --unpack nvidia-352_352.79-0ubuntu1_amd64.deb && \
    dpkg --unpack nvidia-352-dev_352.79-0ubuntu1_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/opencl



#RUN /tmp/opencl/NVIDIA-Linux-x86_64-352.39.run -s --no-kernel-module
#RUN cp -prv /tmp/opencl/include/CL /usr/include/
#RUN cp -prv /tmp/opencl/lib64/* /usr/lib/
#RUN mkdir -p /etc/OpenCL/vendors/ && \
#    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
#RUN rm -rf /tmp/opencl

