ARG BASE_IMAGE=jianshao/llm-api-base
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

ARG VERSION=snapshot
LABEL version=${VERSION}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
