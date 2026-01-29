#!/bin/bash

if [ "$tf_ver" == "" ]; then
    tf_ver=2.20.0
fi
echo "Using tensorflow version: ${tf_ver}"

base_image=jianshao/tf-rt-base
docker pull ${base_image}:${tf_ver}

image=jianshao/tf-dev-base
docker build -t ${image}:${tf_ver} . --build-arg TAG=${tf_ver} $*
docker push ${image}:${tf_ver}

echo "Done"
