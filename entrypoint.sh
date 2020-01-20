#!/bin/sh
set -e
if [ -d /tmp/.ssh ]; then
  cp -R /tmp/.ssh /root/.ssh
  chmod 700 /root/.ssh
  chmod 600 /root/.ssh/*
  chmod 644 /root/.ssh/*.pub
fi
exec "$@"
