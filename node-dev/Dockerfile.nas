ARG BASE_IMAGE=jianshao/node-dev
ARG TAG=lts

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN rm -rf /home/devel && useradd -ms /bin/bash -N -G users -u 1034 devel

USER devel
ENV HOME=/home/devel
WORKDIR ${HOME}
