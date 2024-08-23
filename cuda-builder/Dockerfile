ARG BASE_IMAGE=python
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG}

ARG PKG_FILE=packages.txt
COPY apt-install.sh ${PKG_FILE} ./
RUN ./apt-install.sh ${PKG_FILE} && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

WORKDIR $HOME
