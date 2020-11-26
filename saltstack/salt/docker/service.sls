docker_daemon:
  file.managed:
    - name: /etc/docker/daemon.json
    - source: salt://docker/docker.jinja
    - template: jinja
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: docker_daemon

docker_running:
  service.running:
    - name: docker
    - watch:
      - module: docker_daemon