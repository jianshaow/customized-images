#!/bin/bash

base_image=jianshao/llm-api-base
docker pull ${base_image}:latest

tag=$(docker inspect --format='{{index .Config.Labels "version"}}' ${base_image})
echo "Using llm api base version ${tag}"

image=jianshao/llm-api-dev
docker build -t ${image}:latest . --build-arg TAG=${tag} --build-arg VERSION=${tag} $*

docker tag ${image}:latest ${image}:${tag}
docker push ${image}:latest
docker push ${image}:${tag}

echo "Done"
