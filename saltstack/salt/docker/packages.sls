docker_packages:
  pkg.installed:
    - pkgs:
      - containerd.io=1.2.13-2   
      - docker-ce=5:19.03.11~3-0~ubuntu-bionic   
      - docker-ce-cli=5:19.03.11~3-0~ubuntu-bionic
    - refresh: True