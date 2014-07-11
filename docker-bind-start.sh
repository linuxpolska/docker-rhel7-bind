#!/bin/sh

BIND_ADDRES="127.0.0.1:53"
BIND_RNDC_ADDRES="127.0.0.1:953"
BIND_CONF="/opt/docker"
CONTARINER="rhel7-bind9"

docker run --name "$CONTARINER" -p $BIND_ADDRES:53/udp -p $BIND_ADDRES:53/tcp -p $BIND_RNDC_ADDRES:953 -v $BIND_CONF:/opt/data:rw -d linuxpolska/docker-rhel7-bind $@
