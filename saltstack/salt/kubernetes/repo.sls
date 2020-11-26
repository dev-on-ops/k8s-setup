kubernetes_repo:
  pkgrepo.managed:
    - name: 'deb https://apt.kubernetes.io/ kubernetes-xenial main'
    - file: /etc/apt/sources.list.d/kubernetes.list
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg