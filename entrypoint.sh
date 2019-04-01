#!/bin/sh
# chmod in linux -R 777

exec /usr/bin/pypi-server \
    --port 8080 \
    "/private_packages"

