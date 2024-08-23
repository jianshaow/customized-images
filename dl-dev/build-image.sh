#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

base_image=python
docker pull ${base_image}:${python_ver}-slim

image=jianshao/dl-dev
docker build -t ${image}:$python_ver . --build-arg TAG=${python_ver}-slim
docker push ${image}:$python_ver

echo "Done"
