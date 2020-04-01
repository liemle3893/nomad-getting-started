#!/bin/bash
DIR=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
set -e
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

levant render -out="${DIR}/job.nomad" -var-file="${DIR}/${var_file}" "${DIR}/job.nomadtpl"
nomad run "${DIR}/job.nomad"
