FROM ubuntu:2204

COPY apt-install.sh packages.txt ./
RUN ./apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel

WORKDIR $HOME
