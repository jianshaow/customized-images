ARG BASE_IMAGE=jianshao/dl-base
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh packages.txt requirements.txt ./
RUN ./apt-install.sh packages.txt

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /requirements.txt
