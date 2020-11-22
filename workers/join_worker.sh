#!/bin/bash
sudo kubeadm join 192.168.255.20:6443 --token 9vr73a.a8uxyaju799qwdjv --discovery-token-ca-cert-hash sha256:7c2e69131a36ae2a042a339b33381c6d0d43887e2de83720eff5359e26aec866

kubeadm join 192.168.255.20:6443 --token vw5qfh.z4q8hty9zsg22p32 \
--discovery-token-ca-cert-hash sha256:f2f6ff1e06b4b299401deae3b4e841a40c9ea722c0e8795ad1aa05d1ba06eec8