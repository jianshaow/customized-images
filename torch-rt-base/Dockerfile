FROM jianshao/python-base:3.11-slim

ARG TORCH_VER=2.3.1
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch==${TORCH_VER}
