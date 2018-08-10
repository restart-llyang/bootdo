#!/bin/sh
PID=$(cat /var/run/bootdo-docker-1.6.9.pid)
kill -9 $PID
