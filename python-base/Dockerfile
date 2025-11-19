ARG BASE_IMAGE=python
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG}

ARG DOCKER_GID=117
COPY apt-install.sh /
RUN useradd -ms /bin/bash devel && \
    groupadd -g ${DOCKER_GID} docker && \
    usermod -aG docker devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

WORKDIR $HOME
