#!/bin/bash
kubeadm init --control-plane-endpoint "192.168.255.20:6443" --upload-certs

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get pod -n kube-system -w
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/high-availability/