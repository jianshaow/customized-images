ARG BASE_IMAGE=jianshao/lc-app-base
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

RUN pip install --no-cache-dir flask flask_cors
