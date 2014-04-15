
include:
  - tsuru.install
  - tsuru.config

enable-tsuru-agent:
  cmd.run:
    - name: sed -i -e 's/AGENT_ENABLED=no/AGENT_ENABLED=yes/' /etc/default/tsuru-server
    - user: root
    - require:
      - pkg: tsuru-server

tsuru-ssh-agent:
  service:
    - running
    - require:
      - cmd: enable-tsuru-agent
