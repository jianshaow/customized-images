# torch-dev-base

~~~ shell
export torch_ver=2.2.1
docker build -t jianshao/torch-dev-base:$torch_ver-cpu . -f Dockerfile.cpu
docker build -t jianshao/torch-dev-base:$torch_ver-gpu . -f Dockerfile.gpu
docker push jianshao/torch-dev-base:$torch_ver-cpu
docker push jianshao/torch-dev-base:$torch_ver-gpu
~~~
