#!/usr/bin/env bash

set -e
cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

rm -f ${cwd}/docker-compose.yml
rm -f ${cwd}/*.config
