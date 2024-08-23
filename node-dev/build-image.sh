#!/bin/bash

if [ "$image_tag" == "" ]; then
    image_tag=lts-slim
fi
echo "Using node tag: ${image_tag}"

base_image=node
docker pull ${base_image}:${image_tag}

image=jianshao/node-dev
docker build -t ${image}:${image_tag} . --build-arg TAG=${image_tag}
docker push ${image}:${image_tag}

nas_image=jianshao/node-nas
docker build -t ${nas_image}:${image_tag} . --build-arg TAG=${image_tag} -f Dockerfile.nas
docker push ${nas_image}:${image_tag}

echo "Done"
