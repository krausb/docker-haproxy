#!/bin/bash

# /usr/local/bin/start.sh
# Start HAProxy service

## handle termination gracefully

_term() {
  echo "Terminating HAProxy..."
  service haproxy stop
  service rsyslog stop
  exit 0
}

trap _term SIGTERM

/etc/init.d/rsyslog start 

haproxy -f /etc/haproxy/haproxy.cfg

wait
