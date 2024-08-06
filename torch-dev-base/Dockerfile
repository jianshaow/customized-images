ARG TORCH_VER=2.3.1

FROM jianshao/torch-rt-base:${TORCH_VER}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
