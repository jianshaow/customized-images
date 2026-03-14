ARG BASE_IMAGE=ollama/ollama
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/ollama", "serve" ]

USER ubuntu
ENV HOME=/home/ubuntu

WORKDIR $HOME
