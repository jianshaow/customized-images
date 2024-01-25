ARG BASE_IMAGE=python
ARG TAG=3.11-slim

FROM ${BASE_IMAGE}:${TAG}

COPY apt-install.sh packages.txt requirements.txt /
RUN /apt-install.sh /packages.txt && \
    useradd -ms /bin/bash devel
USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip -i https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --no-cache-dir -r /requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
WORKDIR /workspaces
