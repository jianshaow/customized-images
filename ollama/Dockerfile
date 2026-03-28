ARG BASE_IMAGE=ollama/ollama
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh docker-entrypoint.sh /usr/local/bin/
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    apt-install.sh packages.txt

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/ollama", "serve" ]

USER ubuntu
ENV HOME=/home/ubuntu

WORKDIR $HOME
