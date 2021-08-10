#!/bin/sh

set -eux
curl \
    --form "archive=@${zipfile}" \
    --form 'submit=Release It!' \
    --header 'X-Requested-With: XMLHttpRequest' \
    --user "${INPUTS_USERNAME}:${INPUTS_PASSWORD}" \
    https://manager.pgxn.org/upload
