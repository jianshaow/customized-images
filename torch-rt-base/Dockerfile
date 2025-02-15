ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG}

ARG TORCH_VER=2.4.1
ARG PIP_EXTRA_ARGS=""
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch==${TORCH_VER} torchvision torchaudio ${PIP_EXTRA_ARGS}
