ARG LLAMAINDEX_VER=latest

FROM jianshao/li-app-base:${LLAMAINDEX_VER}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

RUN pip install --no-cache-dir flask flask_cors
