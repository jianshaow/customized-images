# torch-dev-base

~~~ shell
export torch_ver=2.3.1
docker build -t jianshao/torch-dev-base:$torch_ver-cpu . --build-arg TORCH_VER=$torch_ver
docker push jianshao/torch-dev-base:$torch_ver-cpu
docker build -t jianshao/torch-dev-base:$torch_ver-gpu . --build-arg TORCH_VER=$torch_ver --build-arg IMAGE_TYPE=gpu
docker push jianshao/torch-dev-base:$torch_ver-gpu
~~~
