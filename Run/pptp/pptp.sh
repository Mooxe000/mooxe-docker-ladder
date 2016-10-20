#!/usr/bin/env bash

set -e
cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

docker run \
  -d \
  --name=pptp \
  --privileged \
  --net=host \
  -v ${cwd}/chap-secrets.example:/etc/ppp/chap-secrets \
  mobtitude/vpn-pptp
