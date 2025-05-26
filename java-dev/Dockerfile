ARG JAVA_VER=21

FROM jianshao/java-base:${JAVA_VER}

USER root

RUN curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | \
    sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null && \
    echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' | \
    sudo tee /etc/apt/sources.list.d/cloudflared.list

RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel

USER devel
