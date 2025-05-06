#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}-slim

if [ "$pt_ver" == "" ]; then
    pt_ver=2.5.1
fi
echo "Using pytorch version: ${pt_ver}"

if [ "$cuda_tag" == "" ]; then
    cuda_tag=cu124
fi
echo "Using cuda tag: ${cuda_tag}"

image=jianshao/pt-rt-base
tag=${pt_ver}-${cuda_tag}
docker build -t ${image}:${tag} . --build-arg TAG=${python_ver}-slim \
       --build-arg PT_VER=${pt_ver} --build-arg CUDA_TAG=${cuda_tag} $*
docker push ${image}:${tag}

echo "Done"
