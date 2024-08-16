#!/bin/bash

docker pull jianshao/li-app-base:latest

llamaindex_ver=$(docker run --rm jianshao/li-app-base:latest pip list | grep llama-index-core| awk '{print $2}')
echo "Using llama-index version ${llamaindex_ver}"

docker build -t jianshao/li-app-dev:latest . --build-arg LLAMAINDEX_VER=${llamaindex_ver}

docker tag jianshao/li-app-dev:latest jianshao/li-app-dev:${llamaindex_ver}
docker push jianshao/li-app-dev:latest
docker push jianshao/li-app-dev:${llamaindex_ver}

echo "Done"
