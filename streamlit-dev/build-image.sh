#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/py-dev-base
docker pull ${base_image}:${python_ver}

image=jianshao/streamlit-dev
docker build -t ${image}:${tag} . --build-arg TAG=${python_ver} $*
docker push ${image}:${tag}

echo "Done"
