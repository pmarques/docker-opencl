# docker build -t ubuntu_nvidia_opencl .

FROM ubuntu:14.04

MAINTAINER Mario David <mariojmdavid@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list && \
    echo "deb http://archive.ubuntu.com/ubuntu/ trusty-updates multiverse" >> /etc/apt/sources.list && \
    echo "deb http://security.ubuntu.com/ubuntu trusty-security multiverse" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install wget build-essential time

RUN mkdir -p /tmp/opencl
ADD opencl /tmp/opencl/

RUN /tmp/opencl/NVIDIA-Linux-x86_64-352.39.run -s --no-kernel-module
RUN cp -prv /tmp/opencl/include/CL /usr/include/
RUN cp -prv /tmp/opencl/lib64/* /usr/lib/
RUN mkdir -p /etc/OpenCL/vendors/ && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
RUN rm -rf /tmp/opencl

