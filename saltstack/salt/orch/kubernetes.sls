# /srv/salt/orch/webserver.sls
install_kubernetes_lb_components:
  salt.state:
    - tgt: 'haproxy*'
    - sls:
      - load_balancer
      - load_balancer.configure

install_kubernetes_components:
  salt.state:
    - tgt: 'k8s*'
    - sls:
      - kubernetes
