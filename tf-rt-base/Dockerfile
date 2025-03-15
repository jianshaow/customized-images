ARG BASE_IMAGE=tensorflow/tensorflow
ARG TAG=2.18.0

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh /
RUN useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all

WORKDIR $HOME