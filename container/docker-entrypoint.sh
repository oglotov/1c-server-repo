#!/bin/bash

if [ "$1" = "crserver" ]; then
  exec gosu usr1cv8 /opt/1C/v8.3/i386/crserver
fi

exec "$@"
