#!/bin/bash

if [ -z "$node_ver" ]; then
    node_ver=lts
fi
echo "Using node tag: ${node_ver}-slim"

base_image=node
docker pull ${base_image}:${node_ver}-slim

image=jianshao/node-dev
docker build -t ${image}:${node_ver} . --build-arg TAG=${node_ver}-slim $*
docker push ${image}:${node_ver}

nas_image=jianshao/node-nas
docker build -t ${nas_image}:${node_ver} . --build-arg TAG=${node_ver} -f Dockerfile.nas $*
docker push ${nas_image}:${node_ver}

echo "Done"
