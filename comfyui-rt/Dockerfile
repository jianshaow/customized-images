ARG BASE_IMAGE=jianshao/trfs-rt-base
ARG TAG=4.49.0

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt

USER devel
ARG COMFYUI_VER=v0.3.14
ARG COMFYUI_MGR_VER=3.25.1
ADD --chown=devel:devel https://github.com/comfyanonymous/ComfyUI/raw/${COMFYUI_VER}/requirements.txt comfyui_requirements.txt
ADD --chown=devel:devel https://github.com/ltdrdata/ComfyUI-Manager/raw/${COMFYUI_MGR_VER}/requirements.txt comfyui_mgr_requirements.txt
RUN pip install --no-cache-dir -r comfyui_requirements.txt && \
    pip install --no-cache-dir -r comfyui_mgr_requirements.txt

WORKDIR $HOME/comfyui
