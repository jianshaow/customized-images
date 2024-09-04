ARG BASE_IMAGE=jianshao/python-base
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt

USER devel
COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
