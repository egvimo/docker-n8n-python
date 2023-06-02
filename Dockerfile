ARG VERSION=latest

FROM n8nio/n8n:${VERSION}

RUN apk --no-cache add python3
