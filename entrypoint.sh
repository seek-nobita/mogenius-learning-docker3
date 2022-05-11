#!/bin/sh

if [[ -z "$yoursecret251997" ]]; then
    yoursecret251997='This!s@+free_te5t~9527'
fi

exec ss-server \
      -s $SERVER_ADDR \
      -p $SERVER_PORT \
      -k ${yoursecret251997} \
      -m 'chacha20-ietf-poly1305' \
      -t 300 \
      -d '1.0.0.1' \
      --reuse-port
