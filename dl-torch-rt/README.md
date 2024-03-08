# dl-torch-rt

~~~ shell
export torch_ver=2.2.1
docker build -t jianshao/dl-torch-rt:$torch_ver-cpu . -f Dockerfile.cpu
docker build -t jianshao/dl-torch-rt:$torch_ver-gpu . -f Dockerfile.gpu
docker push jianshao/dl-torch-rt:$torch_ver-cpu
docker push jianshao/dl-torch-rt:$torch_ver-gpu
~~~
