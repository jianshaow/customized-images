ARG BASE_IMAGE=node
ARG TAG=lts-slim

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh /
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt && \
    npm update -g npm yarn && \
    npm install -g pnpm serve

USER node
ENV HOME /home/node
WORKDIR $HOME

EXPOSE 3000
