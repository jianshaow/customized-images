ARG BASE_IMAGE=jianshao/trfs-rt-base
ARG TAG=4.49.0

FROM jianshao/py-builder:3.12 as build
RUN pip wheel --no-deps insightface

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt

USER devel
ARG COMFYUI_VER=v0.3.27
ARG COMFYUI_MGR_VER=3.31.6
ADD --chown=devel:devel https://raw.githubusercontent.com/comfyanonymous/ComfyUI/${COMFYUI_VER}/requirements.txt /tmp/comfyui_requirements.txt
ADD --chown=devel:devel https://raw.githubusercontent.com/ltdrdata/ComfyUI-Manager/${COMFYUI_MGR_VER}/requirements.txt /tmp/comfyui_mgr_requirements.txt
COPY --from=build $HOME/*.whl /tmp/

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir -r /tmp/comfyui_requirements.txt && \
    pip install --no-cache-dir -r /tmp/comfyui_mgr_requirements.txt && \
    pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir /tmp/*.whl && \
    rm -f /tmp/*

WORKDIR $HOME/comfyanonymous/ComfyUI
