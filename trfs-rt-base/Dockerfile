ARG BASE_IMAGE=jianshao/pt-rt-base
ARG TAG=2.5.1-cu124

FROM ${BASE_IMAGE}:${TAG}

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
