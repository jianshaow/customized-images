ARG BASE_IMAGE=node
ARG TAG=lts-slim

FROM ${BASE_IMAGE}:${TAG}

RUN useradd -ms /bin/bash -N -G users -u 1034 devel && \
    npm install -g npm && npm install -g serve

USER devel
ENV HOME=/home/devel
WORKDIR ${HOME}

CMD [ "bash" ]
EXPOSE 3000
