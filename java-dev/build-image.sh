#!/bin/bash

if [ "$java_ver" == "" ]; then
    java_ver=21
fi
echo "Using java version: ${java_ver}"

base_image=jianshao/java-base
docker pull ${base_image}:${java_ver}

image=jianshao/java-dev
docker build -t ${image}:${java_ver} . --build-arg TAG=${java_ver} \
docker push ${image}:${java_ver}

echo "Done"
