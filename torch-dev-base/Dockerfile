ARG TORCH_VER=2.3.0
ARG IMAGE_TYPE=cpu

FROM jianshao/torch-rt-base:${TORCH_VER}-${IMAGE_TYPE}

USER root
COPY packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
