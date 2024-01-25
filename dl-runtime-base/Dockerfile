ARG BASE_IMAGE=python
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG}

RUN useradd -ms /bin/bash dluser
USER dluser
ENV HOME=/home/dluser
ENV PATH=$HOME/.local/bin:$PATH

WORKDIR /workspaces
