ARG BASE_IMAGE=jianshao/pt-rt-base
ARG TAG=2.1.2-cu121

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt

USER devel
ARG SD_WEBUI_VER=v1.10.1
ADD --chown=devel:devel https://github.com/AUTOMATIC1111/stable-diffusion-webui/raw/${SD_WEBUI_VER}/requirements_versions.txt /tmp/requirements.txt

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    pip install --no-cache-dir -r requirements.txt && \
    rm -f /tmp/*

WORKDIR $HOME/stable-diffusion-webui
