ARG IMAGE_TYPE=cpu

FROM jianshao/torch-rt-base:2.2.1-${IMAGE_TYPE}

USER root
COPY apt-install.sh packages.txt /root/
RUN /root/apt-install.sh /root/packages.txt
USER devel
