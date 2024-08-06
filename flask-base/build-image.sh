#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

docker build -t jianshao/flask-base:3 . --build-arg TAG=${python_ver}-slim
docker push jianshao/flask-base:3

echo "Done"
