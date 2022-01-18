#!/bin/bash

KEEP_DAYS=14

if [ ! -d /var/log/remote/ ]; then
    echo "/var/log/remote/ does not exist"
    exit 0
fi

find /var/log/remote/ -daystart -mtime +${KEEP_DAYS} -type f -exec rm {} \;
find /var/log/remote/ \( -not -name '*.gz' \) -daystart -mtime +1 -type f -exec pigz {} \;
