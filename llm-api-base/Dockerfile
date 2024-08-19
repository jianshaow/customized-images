ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.11-slim
ARG VERSION=snapshot

FROM ${BASE_IMAGE}:${TAG}

LABEL version=${VERSION}

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
