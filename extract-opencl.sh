#!/bin/sh

#
# docker-opencl - dockerfile Ubuntu 14.04 (LTS) with opencl
# Copyright (C) LIP and IndigoDataCloud EU project
# Author: Mario David <david@lip.pt>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Usage
URLDFT='http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run'

echo "Download, extract and compile opencl libs"
echo "Usage: $0 [<TARBALL_URL>]"
echo "Default: TARBALL_URL=${URLDFT}"
echo

URL=${1:-$URLDFT}

# Prepare dir to download and extract tarball
WORKDIR=`pwd`/temp
INSTALL_DIR=${WORKDIR}/install

mkdir -p ${WORKDIR}
cd ${WORKDIR}

RUN_FILE="cuda_7.5.18_linux.run"

if [ ! -e ${RUN_FILE} ]
then
    echo "== Run wget"
    wget ${URL}
    echo "==========="
fi

chmod 700 ${RUN_FILE}

echo "== Extract ${RUN_FILE}"
./cuda_7.5.18_linux.run --silent  --extract=${WORKDIR}
echo "==========="

CUDA_RUN=`find . -name 'cuda-linux64*.run'`
NV_DRV=`find . -name 'NVIDIA-Linux-x86_64*.run'`
chmod 700 ${CUDA_RUN}
chmod 700 ${NV_DRV}

echo "== Install ${CUDA_RUN}"
./${CUDA_RUN} -noprompt -prefix=${INSTALL_DIR}
echo "==========="

OCL_DIR=${WORKDIR}/opencl
mkdir -p ${OCL_DIR}/lib64
mkdir -p ${OCL_DIR}/include

echo "== Copy NVIDIA driver installer, the opencl include and lib"
cp -prv ${WORKDIR}/${NV_DRV} ${OCL_DIR}/
cp -prv ${INSTALL_DIR}/lib64/libOpenCL.so ${OCL_DIR}/lib64/
cp -prv ${INSTALL_DIR}/include/CL ${OCL_DIR}/include
echo "==========="

