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

image=jianshao/trfs-rt-base
docker build -t ${image}:latest . --build-arg BASE_VER=${base_tag} $*

trfs_ver=$(docker run --rm ${image}:latest pip list | grep transformers | awk '{print $2}')
echo "Using transformers version ${trfs_ver}"

docker tag ${image}:latest ${image}:${trfs_ver}
docker push ${image}:latest
docker push ${image}:${base_tag}

echo "Done"
