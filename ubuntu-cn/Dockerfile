ARG BASE_IMAGE=ubuntu
ARG TAG=24.04

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh /
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt

USER ubuntu
ENV HOME=/home/ubuntu

ENV GTK_IM_MODULE=fcitx
ENV QT_IM_MODULE=fcitx
ENV XMODIFIERS=@im=fcitx
ENV IM_CONFIG_PHASE=2

WORKDIR $HOME
