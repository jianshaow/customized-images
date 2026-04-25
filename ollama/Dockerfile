ARG BASE_IMAGE=ubuntu
ARG TAG=24.04
ARG OLLAMA_IMAGE=ollama/ollama
ARG OLLAMA_TAG=latest

FROM ${OLLAMA_IMAGE}:${OLLAMA_TAG} AS ollama
RUN mkdir /tmp/libs && cp -a /usr/lib/ollama/*.so* /tmp/libs/

FROM ${BASE_IMAGE}:${TAG}

COPY docker-entrypoint.sh /usr/local/bin/
COPY --from=ollama /usr/bin/ollama /usr/bin/
COPY --from=ollama /tmp/libs /usr/lib/ollama
COPY --from=ollama /usr/lib/ollama/cuda_v13 /usr/lib/ollama/cuda_v13
COPY --from=ollama /usr/lib/ollama/vulkan /usr/lib/ollama/vulkan

RUN --mount=type=bind,source=apt-install.sh,target=/usr/local/bin/apt-install.sh \
--mount=type=bind,source=packages.txt,target=packages.txt \
apt-install.sh packages.txt

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
ENV OLLAMA_HOST=0.0.0.0:11434

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/ollama", "serve" ]

USER ubuntu
ENV HOME=/home/ubuntu

WORKDIR $HOME
