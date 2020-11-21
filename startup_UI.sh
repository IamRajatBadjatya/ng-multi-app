#!/bin/sh
# Replace env.js data with env vars
# sh /home/nscadm/generate_env_js.sh >/usr/share/nginx/html/assets/env.js
cd /etc/init.d
nginx -g "daemon off;"
while true
do
  sleep 5
done