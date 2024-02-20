FROM node:lts-slim

RUN useradd -ms /bin/bash -N -G users -u 1034 devel && \
    npm install -g npm && npm install -g serve

USER devel
ENV HOME=/home/devel
WORKDIR ${HOME}

CMD [ "bash" ]
EXPOSE 3000
