ARG BASE_IMAGE=jianshao/py-rt-base
ARG TAG=3.12

FROM ${BASE_IMAGE}:${TAG}

USER root
ARG OLLAMA_VER=v0.40.16
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
  apt-install.sh packages.txt && \
  wget -qO- "https://github.com/ollama/ollama/releases/download/${OLLAMA_VER}/ollama-linux-amd64.tar.zst" | \
  zstd -d | tar -xf - -C /usr && rm -rf /usr/lib/ollama/cuda_v12

COPY docker-entrypoint.sh /usr/local/bin/

ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility
ENV NVIDIA_VISIBLE_DEVICES=all
ENV OLLAMA_HOST=0.0.0.0:11434

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/ollama", "serve" ]

USER devel
