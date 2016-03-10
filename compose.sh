#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
set -e

. ${cwd}/chap-secrets.sh

bash -lc " \
  export $(grep "^[^#]" ${cwd}/config.sh | xargs) && \
  cat ${cwd}/compose.yml | envsubst > \
  ${cwd}/compose/docker-compose.yml \
"
