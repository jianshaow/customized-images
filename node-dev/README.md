# node-dev

~~~ shell
export image_tag=lts-slim
docker build -t jianshao/node-dev:$image_tag .
docker push jianshao/node-dev:$image_tag
docker build -t jianshao/node-nas:$image_tag . -f Dockerfile.nas
docker push jianshao/node-nas:$image_tag
~~~
