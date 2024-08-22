#!/bin/bash

base_image=jianshao/lc-app-base
docker pull ${base_image}:latest

lc_ver=$(docker run --rm ${base_image}:latest pip list | grep langchain-core | awk '{print $2}')
echo "Using langchain version ${lc_ver}"

image=jianshao/lc-app-dev
docker build -t ${image}:latest . --build-arg TAG=${lc_ver}

docker tag ${image}:latest ${image}:${lc_ver}
docker push ${image}:latest
docker push ${image}:${lc_ver}

echo "Done"
