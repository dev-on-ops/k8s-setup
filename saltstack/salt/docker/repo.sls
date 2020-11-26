docker_repo:
  pkgrepo.managed:
    - name: 'deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable'
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg
