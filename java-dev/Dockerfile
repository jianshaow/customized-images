ARG JAVA_VER=21

FROM jianshao/java-base:${JAVA_VER}

RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel

WORKDIR $HOME
