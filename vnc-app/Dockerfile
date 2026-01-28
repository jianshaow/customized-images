ARG BASE_IMAGE=accetto/ubuntu-vnc-xfce-firefox-g3
ARG TAG=24.04

FROM ${BASE_IMAGE}:${TAG}

USER root
COPY apt-install.sh /
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt upgrade

ENV DEBIAN_FRONTEND=noninteractive

RUN ln -fs /usr/share/zoneinfo/America/Los_Angeles /etc/localtime \
 && dpkg-reconfigure -f noninteractive tzdata

USER headless
