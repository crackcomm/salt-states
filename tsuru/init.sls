
include:
  - tsuru.install
  - tsuru.config
  - tsuru.platforms
  - tsuru.ssh-agent

enable-tsuru:
  cmd.run:
    - name: sed -i -e 's/=no/=yes/' /etc/default/tsuru-server
    - user: root
    - require:
      - pkg: tsuru-server

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
