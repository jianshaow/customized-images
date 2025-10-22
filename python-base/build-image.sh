#!/bin/bash

if [ -z "$python_ver" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

docker pull python:${python_ver}

docker build -t jianshao/python-base:${python_ver} . --build-arg TAG=${python_ver} $*
docker push jianshao/python-base:${python_ver}

echo "Done"
