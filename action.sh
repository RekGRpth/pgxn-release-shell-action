#!/bin/sh

set -eux
curl --location --output "${GITHUB_REPOSITORY##*/}-${GITHUB_REF##*/}.zip" "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/archive/refs/tags/${GITHUB_REF##*/}.zip"
curl \
    --form "archive=@${GITHUB_REPOSITORY##*/}-${GITHUB_REF##*/}.zip" \
    --form 'submit=Release It!' \
    --header 'X-Requested-With: XMLHttpRequest' \
    --user "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}:${INPUTS_PASSWORD}" \
    https://manager.pgxn.org/upload
