#/usr/bin/bash

PCAP_DIR="/var/log/tcpdump"
DURATION=3600
FILTER=""

if [ -f /etc/tcpdumpd/tcpdumpd.conf ]; then
    source /etc/tcpdumpd/tcpdumpd.conf
fi

ip_all=$(ip -f inet -o addr |cut -d\  -f 7 | cut -d/ -f 1)

START=1
for ip in ${ip_all}; do
    if [ ${START} -eq 1 ]; then
        FILTER="not host ${ip}"
        START=0
    else
        FILTER="${FILTER} and not host ${ip}"
    fi
done

mkdir -p ${PCAP_DIR}
chown -R tcpdump:tcpdump ${PCAP_DIR}
/usr/bin/tcpdump -n -i br0 -s 0 -G ${DURATION} -w ${PCAP_DIR}/tcpdump-%Y%m%d-%H%M.pcap ${TCPDUMP_OPTS} ${FILTER}