#!/bin/sh

exec /usr/bin/pypi-server \
    --port 8080 \
    "/private_packages"
