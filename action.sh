#!/bin/sh

set -eux
curl --location --output "${GITHUB_REPOSITORY##*/}-${GITHUB_REF##*/}.zip" "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/archive/refs/tags/${GITHUB_REF##*/}.zip"
STATUS="$(curl --form "archive=@${GITHUB_REPOSITORY##*/}-${GITHUB_REF##*/}.zip" --form 'submit=Release It!' --header 'X-Requested-With: XMLHttpRequest' --user "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}:${INPUTS_PASSWORD}" --write-out "%{http_code}" https://manager.pgxn.org/upload)"
test "${STATUS}" -ne 200 && exit 1
