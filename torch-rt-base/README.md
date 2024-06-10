# torch-rt-base

~~~ shell
export torch_ver=2.3.1
docker build --build-arg PYPI_INDEX_ARG="-i https://download.pytorch.org/whl/cpu" \
             -t jianshao/torch-rt-base:$torch_ver-cpu .
docker build -t jianshao/torch-rt-base:$torch_ver-gpu .
docker push jianshao/torch-rt-base:$torch_ver-cpu
docker push jianshao/torch-rt-base:$torch_ver-gpu
~~~
