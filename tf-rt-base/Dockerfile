ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG}

ARG TF_VER=2.19.0
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir tensorflow[and-cuda]==${TF_VER}

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
