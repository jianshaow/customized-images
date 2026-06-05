ARG BASE_IMAGE=node
ARG TAG=lts-slim

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh docker-entrypoint.sh /usr/local/bin/
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    useradd -ms /bin/bash -N -G users -u 1034 devel && \
    apt-install.sh packages.txt && \
    npm update -g npm yarn && \
    npm install -g pnpm serve

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/bash" ]

USER devel
ENV HOME=/home/devel
WORKDIR ${HOME}

EXPOSE 3000
