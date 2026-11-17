ARG BASE_IMAGE=jianshao/trfs-rt-base
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    apt-install.sh packages.txt

USER devel
ARG COMFYUI_VER=v0.45.0
ADD --chown=devel:devel https://raw.githubusercontent.com/comfyanonymous/ComfyUI/${COMFYUI_VER}/requirements.txt /tmp/requirements.txt
ADD --chown=devel:devel https://raw.githubusercontent.com/comfyanonymous/ComfyUI/${COMFYUI_VER}/manager_requirements.txt /tmp/manager_requirements.txt
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /tmp/requirements.txt && \
    pip install --no-cache-dir -r /tmp/manager_requirements.txt && \
    pip install --no-cache-dir -r requirements.txt

WORKDIR $HOME/ComfyUI
