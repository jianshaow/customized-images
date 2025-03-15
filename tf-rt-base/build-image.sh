#!/bin/bash

if [ "$tf_ver" == "" ]; then
    tf_ver=2.18.0
fi
echo "Using tensorflow version: ${tf_ver}"

base_image=tensorflow/tensorflow
docker pull ${base_image}:${tf_ver}-gpu

image=jianshao/tf-rt-base
docker build -t ${image}:${tf_ver} . --build-arg TAG=${tf_ver}-gpu \
       --build-arg TF_VER=${tf_ver} $*
docker push ${image}:${tf_ver}

echo "Done"
