#!/bin/bash

if [ "$ubuntu_ver" == "" ]; then
    ubuntu_ver=24.04
fi
echo "Using Ubuntu version: ${ubuntu_ver}"

base_image=ubuntu
docker pull ${base_image}:${ubuntu_ver}

image=jianshao/ubuntu-cn
docker build -t ${image}:${ubuntu_ver} . --build-arg TAG=${ubuntu_ver} $*
docker push ${image}:${ubuntu_ver}

echo "Done"
