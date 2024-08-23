ARG BASE_IMAGE=node
ARG TAG=lts-slim

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh packages.txt ./
RUN ./apt-install.sh packages.txt && \
    npm install -g npm && npm install -g serve

USER node
ENV HOME /home/node
WORKDIR $HOME

EXPOSE 3000
