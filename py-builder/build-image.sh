#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

docker pull python:${python_ver}-slim

image=jianshao/py-builder
docker build -t ${image}:${python_ver} . --build-arg TAG=${python_ver}-slim $@
docker push ${image}:${python_ver}

echo "Done"
