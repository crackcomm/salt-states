
include:
  - beanstalkd
  - redis
  - git-daemon
  - gandalf
  - mongodb-10gen
  - hipache

apt-tsuru-repo:
  cmd.run:
    - user: root
    - name: apt-add-repository -y ppa:tsuru/lvm2

tsuru-server:
  file:
    - managed
    - name: /etc/tsuru/tsuru.conf
    - source: salt://tsuru/tsuru.conf
    - skip_verify: True
  pkg:
    - installed
    - require:
      - cmd: apt-tsuru-repo

enable-tsuru:
  cmd.run:
    - name: sed -i -e 's/=no/=yes/' /etc/default/tsuru-server
    - user: root
    - require:
      - pkg: tsuru-server

tsuru-ssh-agent:
  service:
    - running
    - require:
      - cmd: enable-tsuru

tsuru-server-api:
  service:
    - running
    - require:
      - cmd: enable-tsuru

tsuru-server-collector:
  service:
    - running
    - require:
      - cmd: enable-tsuru

mongo:
  service:
    - running
    - enable: True
    - require:
      - pkg: mongodb-10gen

git-daemon:
  service:
    - running
    - enable: True
    - require:
      - pkg: git-daemon-run
