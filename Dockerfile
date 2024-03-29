FROM caddy:2.5.0-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddyserver/forwardproxy@caddy2

FROM alpine:3.15

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD [ "caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile" ]
