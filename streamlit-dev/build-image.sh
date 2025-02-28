#!/bin/bash

if [ "$python_ver" == "" ]; then
    python_ver=3.12
fi
echo "Using python version: ${python_ver}"

base_image=jianshao/py-dev-base
docker pull ${base_image}:${python_ver}

image=jianshao/streamlit-dev
docker build -t ${image}:latest . --build-arg TAG=${python_ver} $*

streamlit_ver=$(docker run --rm ${image}:latest pip list | grep streamlit | awk '{print $2}')
echo "Using streamlit version ${streamlit_ver}"

docker tag ${image}:latest ${image}:${streamlit_ver}
docker push ${image}:latest
docker push ${image}:${streamlit_ver}

echo "Done"
