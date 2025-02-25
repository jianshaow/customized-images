ARG BASE_IMAGE=jianshao/py-builder
ARG TAG=3.12

FROM ${BASE_IMAGE}:${TAG}

ARG KEYRING_DEB_URL=https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
ARG NVCC_PKG=cuda-nvcc-12-4

ADD ${KEYRING_DEB_URL} cuda-keyring_all.deb
USER root
RUN dpkg -i cuda-keyring_all.deb && rm cuda-keyring_all.deb && apt-get update && \
    apt-get install -y --no-install-recommends ${NVCC_PKG} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER devel
