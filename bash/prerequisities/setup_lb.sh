#!/bin/bash
apt update
apt install haproxy -y
apt install keepalived -y
systemctl enable haproxy
systemctl enable keepalived


# https://www.haproxy.com/blog/exploring-the-haproxy-stats-page/
# https://tecadmin.net/setup-ip-failover-on-ubuntu-with-keepalived/
# https://www.digitalocean.com/community/tutorials/how-to-use-haproxy-to-set-up-http-load-balancing-on-an-ubuntu-vps
# https://github.com/kubernetes/kubeadm/blob/master/docs/ha-considerations.md#options-for-software-load-balancing
