#!/usr/bin/env bash

PassWord=""

set -e

docker rm ss
docker run \
  -d \
  --name=ss \
  --rm\
  -p 8388:8388 \
  tommylau/shadowsocks \
  -s 0.0.0.0 \
  -p 8388 \
  -k ${PassWord} \
  -m aes-256-cfb
