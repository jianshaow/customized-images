#!/bin/bash

base_image=mcp/gitlab
docker pull ${base_image}:latest

image=jianshao/mcp-gitlab
docker build -t ${image}:latest . $*
docker push ${image}:latest

echo "Done"
