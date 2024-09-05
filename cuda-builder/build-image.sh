#!/bin/bash

if [ "$cuda_ver" == "" ]; then
    cuda_ver=12.5.1
fi
echo "Using cuda version: ${cuda_ver}"

base_image=nvidia/cuda
docker pull ${base_image}:${cuda_ver}-devel-ubuntu22.04

image=jianshao/cuda-builder
docker build -t ${image}:${cuda_ver} . --build-arg TAG=${cuda_ver}-devel-ubuntu22.04 $*
docker push ${image}:${cuda_ver}

echo "Done"
