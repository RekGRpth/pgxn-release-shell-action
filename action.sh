#!/bin/sh

set -eux
curl --location --output "${GITHUB_REPOSITORY##*/}-${INPUTS_TAG:-${GITHUB_REF##*/}}.zip" "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}/archive/refs/tags/${INPUTS_TAG:-${GITHUB_REF##*/}}.zip"
STATUS="$(curl \
    --form "archive=@${GITHUB_REPOSITORY##*/}-${INPUTS_TAG:-${GITHUB_REF##*/}}.zip" \
    --form 'submit=Release It!' \
    --header 'X-Requested-With: XMLHttpRequest' \
    --output /dev/stderr \
    --user "${INPUTS_USERNAME:-${GITHUB_REPOSITORY_OWNER}}:${INPUTS_PASSWORD}" \
    --write-out "%{http_code}" \
    https://manager.pgxn.org/upload)"
test "${STATUS}" -eq "200" || exit 1
