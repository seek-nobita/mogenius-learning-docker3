#!/bin/sh

if [[ -z "$yoursecret251997" ]]; then
    yoursecret251997='This!s@+free_te5t~9527'
fi

exec ssserver \
    -s ${SERVER_ADDR}:${SERVER_PORT} \
    -k ${yoursecret251997} \
    -m 'aes-256-gcm' \
    --log-without-time \
    --dns '1.0.0.1' \
    --worker-threads 4 \
    --plugin '/usr/bin/v2ray-plugin' \
    --plugin-opts "loglevel=none;server;path=/426_editorial-${spath}"
