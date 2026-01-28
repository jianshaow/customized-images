#!/bin/bash

if [ "$trfs_ver" == "" ]; then
    trfs_ver=latest
fi
echo "Using transformers version ${trfs_ver}"

base_image=jianshao/trfs-rt-base
docker pull ${base_image}:${trfs_ver}

if [ "$comfyui_ver" == "" ]; then
    comfyui_ver=$(curl -sL https://api.github.com/repos/comfyanonymous/ComfyUI/releases/latest | grep tag_name | cut -d '"' -f4)
fi
echo "Using ComfyUI version ${comfyui_ver}"

image=jianshao/comfyui-rt
docker build -t ${image}:latest . --build-arg TAG=${trfs_ver} \
       --build-arg COMFYUI_VER=${comfyui_ver} $*

docker tag ${image}:latest ${image}:${comfyui_ver}
docker push ${image}:latest
docker push ${image}:${comfyui_ver}

echo "Done"
