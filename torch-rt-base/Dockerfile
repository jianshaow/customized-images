ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG} as torch

ARG TORCH_VER=2.4.1
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch==${TORCH_VER} torchvision torchaudio

FROM torch as build
USER root
RUN apt install -y wget &&\
    wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb &&\
    dpkg -i cuda-keyring_1.1-1_all.deb &&\
    apt update && apt install cuda-nvcc-12-4 &&\
USER devel
RUN pip install flash-attn --no-build-isolation

FROM torch
COPY --from=build /home/devel/.local/lib/python3.12/site-packages/flash_attn* /home/devel/.local/lib/python3.12/site-packages/
