ARG BASE_IMAGE=jianshao/node-dev
ARG TAG=lts

FROM ${BASE_IMAGE}:${TAG}

RUN useradd -ms /bin/bash -N -G users -u 1034 devel

USER devel
ENV HOME=/home/devel
WORKDIR ${HOME}
