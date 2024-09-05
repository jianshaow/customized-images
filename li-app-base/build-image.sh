#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.11
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}-slim

image=jianshao/li-app-base
docker build -t ${image}:latest . --build-arg TAG=${python_ver}-slim $*

li_ver=$(docker run --rm ${image}:latest pip list | grep llama-index-core | awk '{print $2}')
echo "Using llama-index version ${li_ver}"

docker tag ${image}:latest ${image}:${li_ver}
docker push ${image}:latest
docker push ${image}:${li_ver}

echo "Done"
