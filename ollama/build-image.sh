#!/bin/bash

if [ "$ollama_ver" == "" ]; then
    ollama_ver=$(curl -sL https://api.github.com/repos/ollama/ollama/releases/latest | grep tag_name | cut -d '"' -f4)
fi
echo "Using ollama version: ${ollama_ver}"

base_tag=24.04
docker pull ubuntu:${base_tag}

image=jianshao/ollama
docker build -t ${image}:latest . --build-arg OLLAMA_VER=${ollama_ver} --build-arg TAG=${base_tag} $*
docker tag ${image}:latest ${image}:${ollama_ver}
docker push ${image}:${ollama_ver}
docker push ${image}:latest

echo "Done"
