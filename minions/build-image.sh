#!/bin/bash

if [ -d "repos/minions" ]; then
    cd repos/minions; git pull; cd -
else
    git clone https://github.com/HazyResearch/minions.git repos/minions
fi

base_image=jianshao/llm-api-base
docker pull ${base_image}:latest

base_tag=$(docker inspect --format='{{index .Config.Labels "version"}}' ${base_image})
echo "Using llm api base version ${base_tag}"

image=jianshao/minions
tag=$(date +%Y%m%d)
docker build -t ${image}:latest . --build-arg TAG=${base_tag} --build-arg VERSION=${tag} $*

docker tag ${image}:latest ${image}:${tag}
docker push ${image}:latest
docker push ${image}:${tag}

echo "Done"
