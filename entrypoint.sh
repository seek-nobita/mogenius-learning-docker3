#!/bin/sh

if [[ -z "$PASS" ]]; then
    PASS='This!s@+free_te5t~9527'
fi

exec ss-server \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k ${PASSWORD} \
      -m 'chacha20-ietf-poly1305' \
      -t 300 \
      -d '1.0.0.1' \
      --reuse-port
