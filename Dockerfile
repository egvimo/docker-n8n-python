ARG VERSION=latest

FROM n8nio/n8n:${VERSION}

USER root

RUN apk --no-cache add python3 py3-pip 7zip

USER node
