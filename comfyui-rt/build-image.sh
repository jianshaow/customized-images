#!/bin/bash

if [ "$trfs_ver" == "" ]; then
    trfs_ver=4.51.3
fi
echo "Using transformers version ${trfs_ver}"

base_image=jianshao/trfs-rt-base
docker pull ${base_image}:${trfs_ver}

if [ "$comfyui_ver" == "" ]; then
    comfyui_ver=v0.3.40
fi
echo "Using ComfyUI version ${comfyui_ver}"

if [ "$comfyui_mgr_ver" == "" ]; then
    comfyui_mgr_ver=3.32.5
fi
echo "Using ComfyUI Manager version ${comfyui_mgr_ver}"

image=jianshao/comfyui-rt
docker build -t ${image}:${comfyui_ver} . --build-arg TAG=${trfs_ver} \
       --build-arg COMFYUI_VER=${comfyui_ver} \
       --build-arg COMFYUI_MGR_VER=${comfyui_mgr_ver} $*

docker push ${image}:${comfyui_ver}

echo "Done"
