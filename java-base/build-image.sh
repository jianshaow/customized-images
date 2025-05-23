#!/bin/bash

if [ "$java_ver" == "" ]; then
    java_ver=21
fi
echo "Using java version: ${java_ver}"

base_image=ubuntu
tag=24.02
docker pull ${base_image}:${tag}

image=jianshao/java-base
docker build -t ${image}:${java_ver} . --build-arg TAG=${tag} \
docker push ${image}:${java_ver}

echo "Done"
