ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt

USER devel
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
