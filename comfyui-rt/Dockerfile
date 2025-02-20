ARG BASE_IMAGE=jianshao/trfs-rt-base
ARG TAG=4.49.0

FROM ${BASE_IMAGE}:${TAG}

ARG COMFYUI_VER=v0.3.14
ADD --chown=devel:devel https://github.com/comfyanonymous/ComfyUI/raw/${COMFYUI_VER}/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
