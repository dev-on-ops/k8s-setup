helm_repo:
  pkgrepo.managed:
    - name: 'deb https://baltocdn.com/helm/stable/debian/ all main'
    - file: /etc/apt/sources.list.d/helm-stable-debian.list
    - key_url: https://baltocdn.com/helm/signing.asc
