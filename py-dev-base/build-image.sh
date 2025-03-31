#!/bin/bash

if [ -z "$python_ver" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}-slim

image=jianshao/py-dev-base
docker build -t ${image}:$python_ver . --build-arg TAG=${python_ver}-slim $*
docker push ${image}:$python_ver

echo "Done"
