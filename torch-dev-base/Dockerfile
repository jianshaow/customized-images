ARG BASE_VER=2.4.1

FROM jianshao/torch-rt-base:${BASE_VER}

USER root
COPY apt-install.sh packages.txt /
RUN /apt-install.sh /packages.txt
USER devel

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
