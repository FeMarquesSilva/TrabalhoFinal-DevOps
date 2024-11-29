#!/bin/bash
# wait-for-it.sh

host=$1
port=$2
shift 2
timeout=15

echo "Waiting for $host:$port to be available..."
while ! nc -z $host $port; do
    sleep 1
    timeout=$((timeout-1))
    if [ $timeout -le 0 ]; then
        echo "Timeout reached, exiting"
        exit 1
    fi
done

echo "$host:$port is now available"
exec "$@"
