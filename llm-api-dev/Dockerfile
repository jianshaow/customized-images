ARG BASE_IMAGE=jianshao/llm-api-base
ARG TAG=latest
ARG VERSION=snapshot

FROM ${BASE_IMAGE}:${TAG}

LABEL version=${VERSION}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

RUN pip install --no-cache-dir flask flask_cors
