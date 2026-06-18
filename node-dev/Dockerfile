ARG BASE_IMAGE=node
ARG TAG=lts-slim

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh docker-entrypoint.sh /usr/local/bin/
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    apt-install.sh packages.txt && ln -s /home/node /home/devel && \
    npm update -g npm yarn pnpm serve

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/bash" ]

USER node
ENV HOME=/home/node
WORKDIR $HOME

EXPOSE 3000
