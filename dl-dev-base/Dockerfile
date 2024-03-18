FROM python:3.11-slim

COPY apt-install.sh packages.txt requirements.txt ./
RUN ./apt-install.sh packages.txt && \
    useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

WORKDIR $HOME
