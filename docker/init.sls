{% set DOCKER_HOST = '127.0.0.1:4243' %}

apt-tsuru-lvm2:
  cmd.run:
    - user: root
    - name: apt-add-repository ppa:tsuru/lvm2 -y && apt-get update -qqy

lxc-docker:
  file:
    - managed
    - name: /etc/apt/sources.list.d/docker.list
    - source: salt://docker/docker.list
    - skip_verify: True
  cmd.run:
    - user: root
    - name: apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    - unless: apt-key list | grep -q 36A1D786
    - require:
      - cmd: apt-tsuru-lvm2
      - file: /etc/apt/sources.list.d/docker.list
  pkg.installed:
    - require:
      - file: /etc/apt/sources.list.d/docker.list

docker-config:
  cmd.run:
    - user: root
    - name: echo "export DOCKER_HOST={{DOCKER_HOST}}" >> ~/.bashrc
    - unless: cat ~/.bashrc | grep "DOCKER_HOST={{DOCKER_HOST}}"
  file:
    - managed
    - name: /etc/default/docker
    - source: salt://docker/docker.conf
    - context:
      DOCKER_HOST: {{DOCKER_HOST}}
    - skip_verify: True

docker:
  service:
    - running
    - enable: True
    - require:
      - pkg: lxc-docker
