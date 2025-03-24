ARG BASE_IMAGE=jianshao/llm-api-base
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

ARG VERSION=snapshot
LABEL version=${VERSION}

COPY --chown=devel:devel repos/minions repos/minions
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -e repos/minions
