ARG BASE_IMAGE=python
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG}

RUN useradd -ms /bin/bash devel && \
    mkdir /workspaces
USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH
ENV PIP_INDEX_URL=https://pypi.tuna.tsinghua.edu.cn/simple

WORKDIR /workspaces
