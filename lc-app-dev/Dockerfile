ARG BASE_IMAGE=jianshao/lc-app-base
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

COPY requirements.txt ./
RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
