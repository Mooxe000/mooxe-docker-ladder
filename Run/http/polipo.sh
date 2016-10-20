#!/usr/bin/env bash

set -e

docker run -d \
  --restart=always
  --name=http-polipo \
  -p 8080:8123 \
  clue/polipo \
  proxyAddress=0.0.0.0
