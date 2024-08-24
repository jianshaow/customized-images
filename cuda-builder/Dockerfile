ARG BASE_IMAGE=nvidia/cuda
ARG TAG=12.5.1-devel-ubuntu22.04

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh packages.txt ./
RUN ./apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

WORKDIR $HOME
