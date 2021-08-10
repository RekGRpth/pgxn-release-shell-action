#!/bin/sh

set -eux
curl --output "${GITHUB_REF##*/}.zip" "https://${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/archive/refs/tags/${GITHUB_REF##*/}.zip"
curl \
    --form "archive=@${GITHUB_REF##*/}.zip" \
    --form 'submit=Release It!' \
    --header 'X-Requested-With: XMLHttpRequest' \
    --user "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}:${INPUTS_PASSWORD}" \
    https://manager.pgxn.org/upload
