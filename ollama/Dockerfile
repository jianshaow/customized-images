ARG BASE_IMAGE=ubuntu
ARG TAG=24.04
ARG OLLAMA_IMAGE=ollama/ollama
ARG OLLAMA_TAG=latest

FROM ${OLLAMA_IMAGE}:${OLLAMA_TAG} as ollama

FROM ${BASE_IMAGE}:${TAG}

COPY docker-entrypoint.sh /usr/local/bin/
COPY --from=ollama /usr/bin/ollama /usr/bin/
COPY --from=ollama /usr/lib/ollama/*.so /usr/lib/ollama/
COPY --from=ollama /usr/lib/ollama/cuda_v13 /usr/lib/ollama/cuda_v13
COPY --from=ollama /usr/lib/ollama/vulkan /usr/lib/ollama/vulkan

RUN --mount=type=bind,source=apt-install.sh,target=/usr/local/bin/apt-install.sh \
    --mount=type=bind,source=packages.txt,target=packages.txt \
    apt-install.sh packages.txt

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/ollama", "serve" ]

USER ubuntu
ENV HOME=/home/ubuntu

WORKDIR $HOME
