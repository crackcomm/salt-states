
apt-add-tsuru:
  cmd.run:
    - user: root
    - name: apt-add-repository -y ppa:tsuru/ppa && apt-get update

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
