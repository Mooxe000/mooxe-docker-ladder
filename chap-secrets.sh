#!/usr/bin/env bash

cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"
. ${cwd}/config.sh

set -e

echo "${UserName} * ${PassWord} *" > \
  ${cwd}/chap-secrets
