#
# Dockerfile for shadowsocks-rust
#

FROM alpine

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 443
ENV TZ UTC

RUN set -ex \
 && apk add --no-cache --virtual .build-deps \
      curl \
      libcap \
 && cd /tmp \
 && curl -sLO `curl -s https://api.github.com/repos/shadowsocks/shadowsocks-rust/releases/latest | grep -E '.+browser.+x86_64-unknown-linux-musl.+z"' | cut -d\" -f4` \
 && curl -sLO `curl -s https://api.github.com/repos/shadowsocks/v2ray-plugin/releases/latest | grep -E '.+browser.+linux-amd64.+z"' | cut -d\" -f4` \
 && tar -xf ./shadows* ssserver -C /usr/bin \
 && tar -xf ./v2* \
 && mv ./v2ray-plugin_* /usr/bin/v2ray-plugin \
 && setcap 'cap_net_bind_service=+ep' /usr/bin/ssserver \
 && apk del .build-deps \
 && rm -rf /tmp/*

USER nobody

COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh
