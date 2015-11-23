# docker-opencl
Dockerfile: Ubuntu 14.04 (LTS) NVIDIA driver v352.39 + opencl

## Pre-conditions

The host machine **has** to have the same driver version of the one which will be installed
in the docker image, check here http://www.nvidia.com/Download/index.aspx?lang=en-us

In the case of this image we are using the NVIDIA driver: NVIDIA-Linux-x86_64-352.39


## Install

* Run extract-opencl.sh to download and extract opencl from the CUDA package
* Run build-docker.sh to build the docker image from dockerfile/Dockerfile



