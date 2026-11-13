
FROM node:22-bookworm AS builder

WORKDIR /build


COPY package.json package-lock.json ./
RUN npm ci --legacy-peer-deps


COPY . .


RUN NODE_OPTIONS=--openssl-legacy-provider npm run build



FROM node:22-bookworm-slim AS runtime

WORKDIR /srv/frontend


RUN npm install -g http-server@14.1.1


RUN groupadd --system sandbox-frontend \
    && useradd --system \
       --gid sandbox-frontend \
       --no-create-home \
       --shell /usr/sbin/nologin \
       sandbox-frontend


COPY --from=builder \
    --chown=sandbox-frontend:sandbox-frontend \
    /build/dist/ ./


USER sandbox-frontend

ENV FRONTEND_PORT=8888
ENV BACKEND_URL=http://backend:8081

EXPOSE 8888

CMD ["sh", "-c", "exec http-server /srv/frontend -a 0.0.0.0 -p \"$FRONTEND_PORT\" --proxy \"$BACKEND_URL\""]
