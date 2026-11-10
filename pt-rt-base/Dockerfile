ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.12

FROM ${BASE_IMAGE}:${TAG}

ARG PT_VER=2.14.1
ARG CUDA_TAG=cu132
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch==${PT_VER} torchvision torchaudio torchcodec \
    --index-url https://download.pytorch.org/whl/${CUDA_TAG}

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
