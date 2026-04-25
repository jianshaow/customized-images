#!/bin/bash

ollama_tag=latest
docker pull ollama/ollama:${ollama_tag}

base_tag=24.04
docker pull ubuntu:${base_tag}

image=jianshao/ollama
docker build -t ${image}:latest . --build-arg OLLAMA_TAG=${ollama_tag} --build-arg TAG=${base_tag} $*

ollama_ver=$(docker run --rm ${image}:latest ollama -v | grep -oE '[0-9]+(\.[0-9]+)+')
echo "Using ollama version: ${ollama_ver}"

docker tag ${image}:latest ${image}:${ollama_ver}
docker push ${image}:${ollama_ver}
docker push ${image}:latest

echo "Done"
