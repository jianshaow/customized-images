ARG BASE_IMAGE=jianshao/pt-rt-base
ARG BASE_VER=2.9.1-cu130

FROM ${BASE_IMAGE}:${BASE_VER}

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
