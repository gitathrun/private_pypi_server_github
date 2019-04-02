#!/bin/sh

exec /usr/bin/pypi-server \
    --port 8080 \
    --passwords . \
    --authenticate . \
    --overwrite \
    "/private_packages"
