#!/bin/bash

if [ "$ubuntu_ver" == "" ]; then
    ubuntu_ver=22.04
fi
echo "Using ubuntu version: ${ubuntu_ver}"

base_image=ubuntu
docker pull ${base_image}:${ubuntu_ver}

image=jianshao/cpp-dev

docker build -t ${image}:latest . --build-arg TAG=${ubuntu_ver} $*

gpp_ver=$(docker run --rm ${image}:latest g++ --version | grep g++ | awk '{print $4}')
echo "Using g++ version ${gpp_ver}"

docker tag ${image}:latest ${image}:${gpp_ver}
docker push ${image}:latest
docker push ${image}:${gpp_ver}

echo "Done"
