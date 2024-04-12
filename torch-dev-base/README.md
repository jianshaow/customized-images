# torch-dev-base

~~~ shell
export torch_ver=2.2.1
docker build -t jianshao/torch-dev-base:$torch_ver-cpu .
docker push jianshao/torch-dev-base:$torch_ver-cpu
docker build -t jianshao/torch-dev-base:$torch_ver-gpu . --build-arg IMAGE_TYPE=gpu
docker push jianshao/torch-dev-base:$torch_ver-gpu
~~~
