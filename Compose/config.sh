#!/usr/bin/env bash

set -e
cwd="$(cd -P -- "$(dirname -- "$0")" && pwd -P)"

# echo ${UserName}
# echo ${PassWord}

if [ -z $UserName ] && [ -z $PassWord ]; then
  echo "env UserName=vpnuser PassWord=vpnpswd ./config.sh"
  . ${cwd}/env.sh
fi

echo "${UserName} * ${PassWord} *" > \
  ${cwd}/pptp.config

# cat <<EOF > ${cwd}/l2tp.config
# VPN_IPSEC_PSK=${PassWord}
# VPN_USER=${UserName}
# VPN_PASSWORD=${PassWord}
# EOF

# echo $(grep "^[^#]" ${cwd}/env.sh | xargs)

bash -c " \
  export $( \
    echo \" \
      UserName=${UserName} \
      PassWord=${PassWord} \
    \" | xargs \
  ) && \
  cat ${cwd}/compose.example.yml | envsubst > \
  ${cwd}/docker-compose.yml \
"
