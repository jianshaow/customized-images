#!/bin/bash

if [ "$pt_ver" == "" ]; then
    pt_ver=2.4.1
fi
echo "Using torch version: ${pt_ver}"

if [ "$cuda_tag" == "" ]; then
    cuda_tag=cu124
fi
echo "Using cuda tag: ${cuda_tag}"

base_image=jianshao/pt-rt-base
base_tag=${pt_ver}-${cuda_tag}
docker pull ${base_image}:${base_tag}

image=jianshao/pt-dev-base
tag=${pt_ver}-${cuda_tag}
docker build -t ${image}:${base_tag} . --build-arg TAG=${base_tag} $*
docker push ${image}:${base_tag}

echo "Done"
