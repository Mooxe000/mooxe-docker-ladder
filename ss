#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
. ${cwd}/config.sh

set -e

docker run \
  -d \
  --name=SS \
  -p 8388:8388 \
  tommylau/shadowsocks \
  -s 0.0.0.0 \
  -p 8388 \
  -k ${PassWord} \
  -m aes-256-cfb
