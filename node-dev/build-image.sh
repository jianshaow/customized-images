#!/bin/bash

base_tag=lts-slim
echo "Using node tag: ${base_tag}"

base_image=node
docker pull ${base_image}:${base_tag}

image=jianshao/node-dev
docker build -t ${image}:lts . --build-arg TAG=${base_tag} $*
docker push ${image}:lts

nas_image=jianshao/node-nas
docker build -t ${nas_image}:lts . --build-arg TAG=${base_tag} -f Dockerfile.nas $*
docker push ${nas_image}:lts

echo "Done"
