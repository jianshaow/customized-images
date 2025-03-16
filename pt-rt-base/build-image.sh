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

if [ "$cuda_tag" == "" ]; then
    cuda_tag=cu124
fi
echo "Using cuda tag: ${cuda_tag}"

image=jianshao/torch-rt-base
tag=${torch_ver}-${cuda_tag}
docker build -t ${image}:${tag} . --build-arg TAG=${python_ver}-slim \
       --build-arg TORCH_VER=${torch_ver} --build-arg CUDA_TAG=${cuda_tag} $*
docker push ${image}:${tag}

echo "Done"
