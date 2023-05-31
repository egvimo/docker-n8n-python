ARG VERSION=latest

FROM n8nio/n8n:${VERSION}

RUN apk add --update python3
