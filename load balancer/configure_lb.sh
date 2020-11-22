#!/bin/bash
rm /etc/haproxy/haproxy.cfg

# copy haproxy to: /etc/haproxy.cfg
# copy keepliaved to: /etc/keepalived/keepalived.cfg
systemctl start haproxy
systemctl start keepalived