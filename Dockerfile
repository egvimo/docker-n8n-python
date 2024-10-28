ARG VERSION=latest

FROM n8nio/n8n:${VERSION}

LABEL org.opencontainers.image.url="https://github.com/egvimo/docker-n8n-python"
LABEL org.opencontainers.image.source="https://github.com/n8n-io/n8n"
LABEL org.opencontainers.image.version=${VERSION}

USER root

RUN apk --no-cache add python3 py3-pip 7zip

USER node
