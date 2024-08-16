ARG LLAMAINDEX_VER=2.3.1

FROM jianshao/li-app-base:${LLAMAINDEX_VER}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel
