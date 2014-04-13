
apt-tsuru-lvm2:
  cmd.run:
    - user: root
    - name: apt-add-repository ppa:tsuru/lvm2 -y && apt-get update -qqy

lxc-docker:
  cmd.run:
    - user: root
    - name: apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    - unless: apt-key list | grep -q 36A1D786
    - require:
      - cmd: apt-tsuru-lvm2
      - file: /etc/apt/sources.list.d/docker.list
  file:
    - managed
    - name: /etc/apt/sources.list.d/docker.list
    - source: salt://docker/docker.list
    - skip_verify: True
  pkg.installed:
    - require:
      - file: /etc/apt/sources.list.d/docker.list

docker-config:
  file:
    - managed
    - name: /etc/default/docker
    - source: salt://docker/docker.conf
    - skip_verify: True

docker:
  service:
    - running
    - enable: True
    - require:
      - pkg: lxc-docker
