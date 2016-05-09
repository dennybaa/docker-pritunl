#!/bin/sh

if [ -z "$*" ]; then
  exec python /sbin/my_init
else
  exec $@
fi
