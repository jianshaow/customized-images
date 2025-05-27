#!/bin/bash

if [ "$java_ver" == "" ]; then
    java_ver=21
fi
echo "Using java version: ${java_ver}"

if [ "$ubuntu_ver" == "" ]; then
    ubuntu_ver=22.04
fi
echo "Using Ubuntu version: ${ubuntu_ver}"

base_image=ubuntu
docker pull ${base_image}:${ubuntu_ver}

image=jianshao/java-base
docker build -t ${image}:${java_ver} . --build-arg TAG=${ubuntu_ver} $*
docker push ${image}:${java_ver}

echo "Done"
