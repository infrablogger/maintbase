#!/bin/bash

source /etc/tcpdumpd/tcpdumpd.conf
KEEP_DAYS=${KEEP_DAYS:-14}
PCAP_DIR=${PCAP_DIR:-/var/log/tcpdump}

if [ ! -d ${PCAP_DIR} ]; then
    echo "${PCAP_DIR} does not exist"
    exit 0
fi

find ${PCAP_DIR} -daystart -mtime +${KEEP_DAYS} -type f -exec rm {} \;
