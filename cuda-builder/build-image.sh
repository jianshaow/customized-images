#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

docker pull python:${python_ver}-slim

if [ "$keyring_deb_url" == "" ]; then
    keyring_deb_url=https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
fi

if [ "$cuda_ver" == "" ]; then
    cuda_ver=12-4
fi
echo "Using cuda version: ${cuda_ver}"

image=jianshao/py-cuda-builder
docker build -t ${image}:${cuda_ver} . --build-arg TAG=${python_ver}-slim \
       --build-arg KEYRING_DEB_URL=${keyring_deb_url} --build-arg NVCC_PKG=cuda-nvcc-${cuda_ver} $*
docker push ${image}:${cuda_ver}

echo "Done"
