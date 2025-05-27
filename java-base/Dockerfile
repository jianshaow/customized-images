ARG BASE_IMAGE=ubuntu
ARG TAG=22.04

FROM ${BASE_IMAGE}:${TAG}

ARG JAVA_VER=21

COPY apt-install.sh /
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt openjdk-${JAVA_VER}-jdk && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel

WORKDIR $HOME
