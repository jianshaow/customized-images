ARG TAG=2.18.0

FROM jianshao/tf-rt-base:${TAG}

USER root
RUN --mount=type=bind,source=packages.txt,target=packages.txt \
    /apt-install.sh packages.txt

USER devel
RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir -r requirements.txt
