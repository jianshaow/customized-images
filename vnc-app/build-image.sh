#!/bin/bash

if [ -z "$ubuntu_vnc_ver" ]; then
    ubuntu_vnc_ver=24.04
fi
echo "Using ubuntu version: ${ubuntu_vnc_ver}"

docker pull accetto/ubuntu-vnc-xfce-firefox-g3:${ubuntu_vnc_ver}

image="jianshao/vnc-app"
docker build -t ${image}:${ubuntu_vnc_ver} . --build-arg TAG=${ubuntu_vnc_ver} $*
docker tag ${image}:${ubuntu_vnc_ver} ${image}:latest

docker push ${image}:${ubuntu_vnc_ver}
docker push ${image}:latest

echo "Done"
