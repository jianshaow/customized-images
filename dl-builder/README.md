# dl-builder

~~~ shell
export python_ver=3.11
docker build -t jianshao/dl-builder:$python_ver .
docker push jianshao/dl-builder:$python_ver

export cuda_ver=12.3
docker build --build-arg BASE_IMAGE=nvidia/cuda --build-arg TAG=12.3.2-devel-ubuntu22.04 --build-arg PKG_FILE=packages.cuda.txt -t jianshao/cuda-builder:$cuda_ver .
docker push jianshao/cuda-builder:$cuda_ver
~~~
