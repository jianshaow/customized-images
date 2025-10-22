#!/bin/bash

if [ -z "$python_ver" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

if [ -z "$ubuntu_ver" ]; then
    ubuntu_ver=24.04
fi
echo "Using ubuntu version: ${ubuntu_ver}"

docker pull ubuntu:${ubuntu_ver}

docker build -t jianshao/python-base:${python_ver} . --build-arg TAG=${ubuntu_ver} --build-arg PY_VER=${python_ver} $*
docker push jianshao/python-base:${python_ver}

echo "Done"
