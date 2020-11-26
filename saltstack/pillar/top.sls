base:
  '*':
    - default
  'haproxy01':
    - load_balancer_primary_k8s
  'haproxy02':
    - load_balancer_secondary_k8s
  
