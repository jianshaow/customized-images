FROM node:lts-slim

COPY apt-install.sh packages.txt ./
RUN ./apt-install.sh packages.txt && \
    npm install -g npm && npm install -g serve

USER node
WORKDIR $HOME

EXPOSE 3000
