#!/usr/bin/env bash

# env PassWord=vpnpswd ./shadowsocks.sh

set -e
cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

docker run \
  -d \
  --name=socks-shadowsocks \
  -p 8388:8388 \
  tommylau/shadowsocks \
  -s 0.0.0.0 \
  -p 8388 \
  -k ${PassWord} \
  -m aes-256-cfb
