FROM jianshao/dl-rt-base:3.11

COPY requirements.txt ./

ARG TORCH_VER=2.3.1
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir torch==${TORCH_VER}
