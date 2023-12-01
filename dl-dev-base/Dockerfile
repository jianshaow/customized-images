ARG BASE_IMAGE=python
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG} as dl-dev-base

COPY apt-install.sh packages.txt /
RUN /apt-install.sh /packages.txt && \
    useradd -ms /bin/bash devel
USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH
WORKDIR /workspaces
