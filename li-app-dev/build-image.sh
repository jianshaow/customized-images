#!/bin/bash

base_image=jianshao/li-app-base
docker pull ${base_image}:latest

li_ver=$(docker run --rm ${base_image}:latest pip list | grep llama-index-core | awk '{print $2}')
echo "Using llama-index version ${li_ver}"

image=jianshao/li-app-dev
docker build -t ${image}:latest . --build-arg TAG=${li_ver} $*

docker tag ${image}:latest ${image}:${li_ver}
docker push ${image}:latest
docker push ${image}:${li_ver}

echo "Done"
