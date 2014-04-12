

docker:
  cmd.run:
    - user: root
    - name: apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    - unless: apt-key list | grep -q 36A1D786
    - require:
      - file: /etc/apt/sources.list.d/docker.list
  file:
    - managed
    - name: /etc/apt/sources.list.d/docker.list
    - source: salt://docker/docker.list
    - skip_verify: True
  pkg.installed:
    - pkgs:
      - lxc-docker
    - require:
      - file: /etc/apt/sources.list.d/docker.list
