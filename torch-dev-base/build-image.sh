#!/bin/bash

if [ "$torch_ver" == "" ]; then
    torch_ver=2.4.1
fi
echo "Using torch version: ${torch_ver}"

base_image=jianshao/torch-rt-base
docker pull ${base_image}:${torch_ver}

docker build -t jianshao/torch-dev-base:${torch_ver} . --build-arg TORCH_VER=${torch_ver} $*
docker push jianshao/torch-dev-base:${torch_ver}

echo "Done"
