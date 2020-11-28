#!/bin/bash
kubeadm join 192.168.255.20:6443 --token vw5qfh.z4q8hty9zsg22p32 \
--control-plane \
--discovery-token-ca-cert-hash sha256:f2f6ff1e06b4b299401deae3b4e841a40c9ea722c0e8795ad1aa05d1ba06eec8 \
--certificate-key 14f4199bc1f2c2e76b2886d3fc2e4551f3a94b4bc58582125d6f808a29dff957

# kubeadm init phase upload-certs --upload-certs

# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/