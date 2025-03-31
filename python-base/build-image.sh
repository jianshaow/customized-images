#!/bin/bash

if [ -z "$python_ver" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

docker pull python:${python_ver}-slim

docker build -t jianshao/python-base:${python_ver}-slim . --build-arg TAG=${python_ver}-slim $*
docker push jianshao/python-base:${python_ver}-slim

echo "Done"
