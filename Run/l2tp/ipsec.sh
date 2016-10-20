#!/usr/bin/env bash

# modprobe af_key
# docker logs ipsec-vpn-server
# docker exec -it ipsec-vpn-server ipsec status

set -e
cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

docker run -d \
  --restart=always \
  --name l2tp-ipsec \
  --env-file ${cwd}/vpn.env.example \
  -p 500:500/udp \
  -p 4500:4500/udp \
  -v /lib/modules:/lib/modules:ro \
  --privileged \
  hwdsl2/ipsec-vpn-server
