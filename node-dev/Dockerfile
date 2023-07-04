FROM node:lts-slim

RUN useradd -m -d /home/devel -s /bin/bash -N -G users -u 1034 devel && \
    npm install -g npm && npm install -g serve

USER devel    
WORKDIR /home/devel
ENTRYPOINT [ "bash" ]
EXPOSE 3000
