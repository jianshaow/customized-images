ARG BASE_IMAGE=ubuntu
ARG TAG=24.04
ARG PY_VER=3.12

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh /
RUN /apt-install.sh python${PY_VER} && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

WORKDIR $HOME
