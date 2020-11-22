#!/bin/bash
curl https://docs.projectcalico.org/manifests/calico.yaml -O
kubectl apply -f calico.yaml
kubectl get pods --all-namespaces
# https://docs.projectcalico.org/getting-started/kubernetes/self-managed-onprem/onpremises