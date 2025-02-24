ARG BASE_IMAGE=python
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG}

ARG KEYRING_DEB_URL=https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
ARG NVCC_PKG=cuda-nvcc-12-4

ADD ${KEYRING_DEB_URL} cuda-keyring_all.deb
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    dpkg -i cuda-keyring_all.deb && rm cuda-keyring_all.deb && \
    apt-get install -y --no-install-recommends ${NVCC_PKG} && \
    /apt-install.sh packages.txt && useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

WORKDIR $HOME
