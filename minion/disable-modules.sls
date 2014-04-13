
disable-modules:
  file:
    - managed
    - name: /etc/salt/minion.d/disable-modules.conf
    - name: salt://minion/disable-modules.conf
    - skip_verify: True
