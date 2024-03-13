FROM nvidia/cuda:12.3.2-devel-ubuntu22.04

COPY apt-install.sh packages.txt ./
RUN ./apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel
USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip
