
tsuru-platforms:
  file:
    - managed
    - name: /etc/tsuru/platforms-setup.js
    - source: salt://tsuru/platforms-setup.js
    - skip_verify: True
  cmd.run:
    - name: cat /etc/tsuru/platforms-setup.js | mongo tsuru
