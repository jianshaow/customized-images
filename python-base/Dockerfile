ARG BASE_IMAGE=python
ARG TAG=3.14-slim

FROM ${BASE_IMAGE}:${TAG}

RUN useradd -ms /bin/bash devel

COPY apt-install.sh /usr/local/bin/

USER devel
ENV HOME=/home/devel
WORKDIR $HOME

RUN python -m venv ${HOME}/.venv
ENV VIRTUAL_ENV=${HOME}/.venv
ENV PATH=${VIRTUAL_ENV}/bin:${PATH}

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
