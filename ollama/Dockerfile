ARG BASE_IMAGE=ubuntu
ARG TAG=24.04
ARG OLLAMA_VER=v0.30.11

FROM ${BASE_IMAGE}:${TAG}

RUN --mount=type=bind,source=apt-install.sh,target=/usr/local/bin/apt-install.sh \
--mount=type=bind,source=packages.txt,target=packages.txt \
apt-install.sh packages.txt && \
wget -qO- "https://github.com/ollama/ollama/releases/download/${OLLAMA_VER}/ollama-linux-amd64.tar.zst" | \
  zstd -d | tar -xf - -C /usr && rm -rf /usr/lib/ollama/cuda_12

COPY docker-entrypoint.sh /usr/local/bin/

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
ENV OLLAMA_HOST=0.0.0.0:11434

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/ollama", "serve" ]

USER ubuntu
ENV HOME=/home/ubuntu

WORKDIR $HOME
