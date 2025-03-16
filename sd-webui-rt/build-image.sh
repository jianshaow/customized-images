#!/bin/bash

if [ "$pt_base_tag" == "" ]; then
    pt_base_tag=2.1.2-cu121
fi
echo "Using torch base tag ${pt_base_tag}"

base_image=jianshao/pt-rt-base
docker pull ${base_image}:${pt_base_tag}

if [ "$sd_webui_ver" == "" ]; then
    sd_webui_ver=v1.10.1
fi
echo "Using SD webui version ${sd_webui_ver}"

image=jianshao/sd-webui-rt
docker build -t ${image}:${sd_webui_ver} . --build-arg TAG=${pt_base_tag} \
       --build-arg SD_WEBUI_VER=${sd_webui_ver} $*

docker push ${image}:${sd_webui_ver}

echo "Done"
