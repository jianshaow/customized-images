#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

docker pull jianshao/python-base:${python_ver}-slim

docker build -t jianshao/li-app-base:latest . --build-arg TAG=${python_ver}-slim

llamaindex_ver=$(docker run --rm jianshao/li-app-base:latest pip list | grep llama-index-core| awk '{print $2}')
echo "Using llama-index version ${llamaindex_ver}"

docker tag jianshao/li-app-base:latest jianshao/li-app-base:${llamaindex_ver}
docker push jianshao/li-app-base:latest
docker push jianshao/li-app-base:${llamaindex_ver}

echo "Done"
