ARG BASE_IMAGE=python
ARG TAG=3.12-slim

FROM ${BASE_IMAGE}:${TAG}

ARG USER=devel
ARG DOCKER_GID=117
RUN useradd -ms /bin/bash ${USER} && \
    groupadd -g ${DOCKER_GID} docker && \
    usermod -aG docker ${USER}

COPY apt-install.sh /

USER ${USER}
ENV HOME=/home/${USER}
WORKDIR $HOME

RUN python -m venv ${HOME}/.venv
ENV VIRTUAL_ENV=${HOME}/.venv
ENV PATH=${VIRTUAL_ENV}/bin:${PATH}

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt
