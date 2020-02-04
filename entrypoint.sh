#!/bin/sh
set -e
ls -l /tmp/.ssh
if [ -d /tmp/.ssh ]; then
  cp -R /tmp/.ssh /root/.ssh
  echo $?
  chmod 700 /root/.ssh
  chmod 600 /root/.ssh/*
  chmod 644 /root/.ssh/*.pub
fi
exec "$@"
