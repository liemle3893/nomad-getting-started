#!/bin/bash
set -e
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
# shellcheck disable=SC2046
unameu="$(tr '[:lower:]' '[:upper:]' <<<$(uname))"

if [[ $unameu == *DARWIN* ]]; then
    var_file="osx.yaml"
elif [[ $unameu == *LINUX* ]]; then
    var_file="linux.yaml"
else
    echo "Unsupported OS"
    exit 1
fi

job_file="${DIR}/ingress.nomad"
levant render -out="${job_file}" -var-file="${DIR}/${var_file}" "${DIR}/ingress.nomadtpl"
nomad run "${job_file}"