ARG BASE_IMAGE=ubuntu
ARG TAG=24.04

FROM ${BASE_IMAGE}:${TAG}

ARG JAVA_VER=21

RUN curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | \
    sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null && \
    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | \
    sudo tee /etc/apt/sources.list.d/cloudflared.list

COPY apt-install.sh /
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt openjdk-${JAVA_VER}-jdk && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel

WORKDIR $HOME
