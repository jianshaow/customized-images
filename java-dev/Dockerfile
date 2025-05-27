ARG JAVA_VER=21

FROM jianshao/java-base:${JAVA_VER}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg > /usr/share/keyrings/cloudflare-main.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' > /etc/apt/sources.list.d/cloudflared.list && \
    /apt-install.sh packages.txt

USER ubuntu
