#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

docker build -t jianshao/dl-rt-base:$python_ver . --build-arg TAG=${python_ver}-slim
docker push jianshao/dl-rt-base:$python_ver

echo "Done"
