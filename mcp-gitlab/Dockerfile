ARG BASE_IMAGE=mcp/gitlab
ARG TAG=latest

FROM ${BASE_IMAGE}:${TAG}

RUN npm install global-agent

ENTRYPOINT [ "node", "--require", "global-agent/bootstrap", "dist/index.js" ]
