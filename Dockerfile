# docker build -t nvidia_pyopencl .

FROM ubuntu:14.04

MAINTAINER Mario David <mariojmdavid@gmail.com>

RUN locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        cython \
        git \
        python-dev \
        python-pip \
        software-properties-common \
        tar \
        wget

RUN mkdir -p /tmp/setup && \
    cd /usr/include && \
    wget http://www.lip.pt/~david/cl_include.tgz && \
    tar zxvf cl_include.tgz && \
    rm -f cl_include.tgz

ENV nvidiadrv NVIDIA-Linux-x86_64-352.39.run

COPY $nvidiadrv /tmp/setup/$nvidiadrv

RUN /tmp/setup/$nvidiadrv -s --no-kernel-module && \
    rm -rf /tmp/setup

#RUN cp -prv /tmp/opencl/include/CL /usr/include/
#RUN cp -prv /tmp/opencl/lib64/* /usr/lib/
#RUN mkdir -p /etc/OpenCL/vendors/ && \
#    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd
#RUN rm -rf /tmp/opencl

