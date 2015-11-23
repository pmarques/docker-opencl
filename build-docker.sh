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

echo "Build the docker image"
echo "Usage: $0"
echo

WORKDIR=`pwd`/temp
OCL_DIR=${WORKDIR}/opencl
DOCKER_DIR=`pwd`/dockerfile

echo "== Move the opencl dir to the docker dir"
mv ${OCL_DIR} ${DOCKER_DIR}/
echo "==========="

cd ${DOCKER_DIR}
docker build -t ubuntu_nvidia_opencl .

