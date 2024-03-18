FROM jianshao/dl-base:3.11

COPY apt-install.sh packages.txt requirements.txt ./
USER root
RUN ./apt-install.sh packages.txt
USER devel

RUN pip install --no-cache-dir --upgrade pip setuptools wheel
