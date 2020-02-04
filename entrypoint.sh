#!/bin/sh
set -e
ls -l /tmp/.ssh
if [ -d /tmp/.ssh ]; then
  cp -R /tmp/.ssh /root/.ssh
  echo $?
  chmod 755 /root/.ssh
  find /root/.ssh/ -type f |xargs -ifil chmod 600 fil
  find /root/.ssh/*.pub -type f |xargs -ifil chmod 644 fil
fi
ls -la /root/.ssh/

exec "$@"
