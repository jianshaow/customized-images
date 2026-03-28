ARG BASE_IMAGE=jianshao/py-dev-base
ARG TAG=3.12

FROM jianshao/ollama:latest AS ollama

FROM ${BASE_IMAGE}:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
apt-install.sh packages.txt && \
mkdir /home/ubuntu && chown -R devel:devel /home/ubuntu

USER devel
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
pip install --no-cache-dir --upgrade pip setuptools wheel && \
pip install --no-cache-dir -r requirements.txt

COPY --from=build /usr/bin/ollama /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/bash" ]
