#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}-slim

if [ "$torch_ver" == "" ]; then
    torch_ver=2.4.1
fi
echo "Using torch version: ${torch_ver}"

docker build -t jianshao/torch-rt-base:${torch_ver} . --build-arg TAG=${python_ver}-slim --build-arg TORCH_VER=${torch_ver} $*
docker push jianshao/torch-rt-base:${torch_ver}

echo "Done"
