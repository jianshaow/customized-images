#!/bin/bash

base_image=ollama/ollama
docker pull ${base_image}:latest

image=jianshao/ollama
docker build -t ${image}:latest . --build-arg TAG=latest $*

ollama_ver=$(docker run --rm ${image}:latest -v | grep -oE '[0-9]+(\.[0-9]+)+')
echo "Using ollama version: ${ollama_ver}"

docker tag ${image}:latest ${image}:${ollama_ver}
docker push ${image}:${ollama_ver}
docker push ${image}:latest

echo "Done"
