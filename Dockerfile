ARG VERSION=latest

FROM node:22-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS build
WORKDIR /build
RUN apk add --no-cache git
RUN git clone https://github.com/egvimo/n8n-nodes-apprise.git .
RUN pnpm install --frozen-lockfile
RUN pnpm run build

FROM n8nio/n8n:${VERSION}

LABEL org.opencontainers.image.url="https://github.com/egvimo/docker-n8n-python"
LABEL org.opencontainers.image.source="https://github.com/n8n-io/n8n"
LABEL org.opencontainers.image.version=${VERSION}

USER root

RUN apk --no-cache add python3 py3-pip 7zip
COPY --from=build --chown=node:node /build/dist /usr/local/lib/node_modules/n8n-nodes-apprise/

USER node

ENV N8N_CUSTOM_EXTENSIONS="/usr/local/lib/node_modules/n8n-nodes-apprise"
