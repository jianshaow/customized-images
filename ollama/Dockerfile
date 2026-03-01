ARG BASE_IMAGE=ollama/ollama
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

USER ubuntu
ENV HOME=/home/ubuntu
ENV PATH="${HOME}/.local/bin:${PATH}"

WORKDIR $HOME
