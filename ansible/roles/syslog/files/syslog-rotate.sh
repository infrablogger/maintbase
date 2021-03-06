#!/bin/bash

source /etc/syslog-rotate/syslog-rotate.conf
KEEP_DAYS=${KEEP_DAYS:-14}

if [ ! -d /var/log/remote/ ]; then
    echo "/var/log/remote/ does not exist"
    exit 0
fi

find /var/log/remote/ -daystart -mtime +${KEEP_DAYS} -type f -exec rm {} \;
find /var/log/remote/ \( -not -name '*.gz' \) -daystart -mtime +0 -type f -exec pigz {} \;
