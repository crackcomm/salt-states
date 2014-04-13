
disable-modules:
  file:
    - managed
    - name: /etc/salt/minion.d/disable-modules.conf
    - source: salt://minion/disable-modules.conf
    - skip_verify: True
  service:
    - running
    - name: salt-minion
    - reload: True
