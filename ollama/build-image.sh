#!/bin/bash

if [ "$ollama_ver" == "" ]; then
    ollama_ver=0.9.6
fi
echo "Using ollama version: ${ollama_ver}"

base_image=ollama/ollama
docker pull ${base_image}:${ollama_ver}

image=jianshao/ollama
docker build -t ${image}:${ollama_ver} . --build-arg TAG=${ollama_ver} $*
docker push ${image}:${ollama_ver}

echo "Done"
