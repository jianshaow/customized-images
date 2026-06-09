ARG JAVA_VER=21

FROM jianshao/java-base:${JAVA_VER}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    apt-install.sh packages.txt && ln -s /home/ubuntu /home/devel

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "/bin/bash" ]

USER ubuntu
