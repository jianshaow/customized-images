#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}

image=jianshao/llm-api-base
tag=$(date +%Y%m%d)
docker build -t ${image}:latest . --build-arg TAG=${python_ver} --build-arg VERSION=${tag} $*

docker tag ${image}:latest ${image}:${tag}
docker push ${image}:latest
docker push ${image}:${tag}

echo "Done"
