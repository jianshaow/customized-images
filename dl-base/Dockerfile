FROM python:3.11-slim

RUN useradd -ms /bin/bash devel

USER devel
ENV HOME=/home/devel
ENV PATH=$HOME/.local/bin:$PATH

WORKDIR $HOME
