ARG BASE_IMAGE=ubuntu
ARG TAG=22.04

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh packages.txt ./
RUN ./apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel

WORKDIR $HOME
