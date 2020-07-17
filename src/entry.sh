#!/bin/bash

# Start nginx
# First, create the '/run/nginx', because it isn't created by default
mkdir -p /run/nginx

# Then, delete the default conf
rm -rf /etc/nginx/conf.d/default.conf

# Change group of balena.sock, because balena-engine group doesn't exist inside the container
# And nginx needs permission
chgrp www-data /var/run/balena.sock

# Apply environment variables to balena-sock.conf
envsubst '${SOCK_PORT} ${SERVER_NAME}' < /tmp/nginx.conf > /etc/nginx/nginx.conf

# Start nginx
echo "$(date) : Starting socket on ${SOCK_PORT} (${SERVER_NAME})"
nginx
