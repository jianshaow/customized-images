#!/bin/bash

if [ "$torch_ver" == "" ]; then
    torch_ver=2.4.1
fi
echo "Using torch version: ${torch_ver}"

if [ "$cuda_tag" == "" ]; then
    cuda_tag=cu124
fi
echo "Using cuda tag: ${cuda_tag}"

base_image=jianshao/torch-rt-base
base_tag=${torch_ver}-${cuda_tag}
docker pull ${base_image}:${base_tag}

image=jianshao/torch-dev-base
tag=${torch_ver}-${cuda_tag}
docker build -t ${image}:${base_tag} . --build-arg BASE_VER=${base_tag} $*
docker push ${image}:${base_tag}

echo "Done"
