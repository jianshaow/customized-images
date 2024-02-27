FROM jianshao/dl-base:3.11-slim

COPY apt-install.sh packages.txt requirements.txt ./
USER root
RUN ./apt-install.sh packages.txt
USER devel

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
