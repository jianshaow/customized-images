#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}-slim

image=jianshao/lc-app-base
docker build -t ${image}:latest . --build-arg TAG=${python_ver}-slim $*

lc_ver=$(docker run --rm ${image}:latest pip list | grep langchain-core | awk '{print $2}')
echo "Using langchain version ${lc_ver}"

docker tag ${image}:latest ${image}:${lc_ver}
docker push ${image}:latest
docker push ${image}:${lc_ver}

echo "Done"
