#!/bin/bash

if [ "$trfs_ver" == "" ]; then
    trfs_ver=4.49.0
fi
echo "Using transformers version ${trfs_ver}"

base_image=jianshao/trfs-rt-base
docker pull ${base_image}:${trfs_ver}

if [ "$comfyui_ver" == "" ]; then
    comfyui_ver=v0.3.14
fi
echo "Using ComfyUI version ${comfyui_ver}"

image=jianshao/comfyui-rt
docker build -t ${image}:${comfyui_ver} . --build-arg TAG=${trfs_ver} $*

docker push ${image}:${comfyui_ver}

echo "Done"
