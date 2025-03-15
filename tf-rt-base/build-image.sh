#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/python-base
docker pull ${base_image}:${python_ver}-slim

if [ "$tf_ver" == "" ]; then
    tf_ver=2.19.0
fi
echo "Using tensorflow version: ${tf_ver}"

image=jianshao/tf-rt-base
docker build -t ${image}:${tf_ver} . --build-arg TAG=${python_ver}-slim \
       --build-arg TF_VER=${tf_ver} $*
docker push ${image}:${tf_ver}

echo "Done"
