
restart-tsuru-ssh-agent:
  cmd.run:
    - user: root
    - name: service tsuru-ssh-agent restart

restart-tsuru-server-api:
  cmd.run:
    - user: root
    - name: service tsuru-server-api restart

restart-tsuru-server-collector:
  cmd.run:
    - user: root
    - name: service tsuru-server-collector restart
