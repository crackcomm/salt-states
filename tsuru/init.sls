
apt-tsuru-repo:
  cmd.run:
    - user: root
    - name: apt-add-repository -y ppa:tsuru/ppa && apt-add-repository -y ppa:tsuru/lvm2

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
      - cmd: tsuru-platforms

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
