# Custom Caddy build with Cloudflare DNS module
FROM caddy:builder AS builder
LABEL org.opencontainers.image.authors="Pedro Barbosa, https://github.com/pedbarbosa"

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy