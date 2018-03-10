#!/bin/bash
# Filename: entrypoint.sh
# Description: Docker entrypoint script for Inspectorio Python base image

set -euxo pipefail

# shellcheck disable=SC2094,SC2016
envsubst '${APP_USER} ${NGINX_WORKER}' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
