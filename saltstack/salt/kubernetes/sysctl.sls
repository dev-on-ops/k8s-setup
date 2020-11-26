kubernetes_sysctl:
  sysctl.present:
    - names: 
      - net.bridge.bridge-nf-call-ip6tables:
        - value: 1
      - net.bridge.bridge-nf-call-iptables:
        - value: 1
    - config: /etc/sysctl.d/k8s.conf