ARG JAVA_VER=21

FROM jianshao/java-base:${JAVA_VER}

USER root
COPY packages.txt /root/
RUN /apt-install.sh /root/packages.txt
USER devel
