ARG BASE_IMAGE=node
ARG TAG=lts-slim

FROM ${BASE_IMAGE}:${TAG}

RUN useradd -ms /bin/bash -N -G users -u 1034 devel && \
    npm update -g npm yarn && \
    npm install -g pnpm serve

USER devel
ENV HOME=/home/devel
WORKDIR ${HOME}

CMD [ "bash" ]
EXPOSE 3000
