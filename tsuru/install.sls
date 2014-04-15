
apt-tsuru-repo:
  cmd.run:
    - user: root
    - name: apt-add-repository -y ppa:tsuru/ppa && apt-add-repository -y ppa:tsuru/lvm2 && apt-get update -qqy

tsuru-server:
  pkg:
    - installed
    - require:
      - cmd: apt-tsuru-repo
