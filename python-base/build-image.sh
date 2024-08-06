#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

docker build -t jianshao/python-base:$python_ver-slim . --build-arg TAG=${python_ver}-slim
docker push jianshao/python-base:$python_ver-slim

echo "Done"
