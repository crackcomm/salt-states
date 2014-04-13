
apt-add-tsuru:
  cmd.run:
    - user: root
    - name: apt-add-repository -qqy ppa:tsuru/ppa && apt-get update -qqy

gandalf-server:
  pkg:
    - installed
    - require:
      - cmd: apt-add-tsuru
  service:
    - running
    - enable: True
    - require:
      - pkg: gandalf-server
