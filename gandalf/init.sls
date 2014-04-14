
apt-tsuru-ppa:
  cmd.run:
    - user: root
    - name: apt-add-repository ppa:tsuru/ppa -y && apt-get update -qqy

/etc/gandalf.conf:
  file:
    - managed
    - source: salt://gandalf/gandalf.conf
    - skip_verify: True

gandalf-server:
  pkg:
    - installed
    - require:
      - cmd: apt-tsuru-ppa
  service:
    - running
    - enable: True
    - require:
      - pkg: gandalf-server
