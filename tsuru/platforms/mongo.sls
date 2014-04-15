
include:
  - mongodb-10gen.repo

mongodb-clients:
  pkg:
    - installed
    - require:
      - cmd: mongodb-repo

# Scripts which inserts platforms to mongodb
/etc/tsuru/platforms-setup.js:
  file:
    - managed
    - source: salt://tsuru/platforms/platforms-setup.js
    - skip_verify: True

# Inserts platforms to mongodb
tsuru-platforms:
  cmd.run:
    - name: cat /etc/tsuru/platforms-setup.js | mongo ds039737.mongolab.com:39737/tsuru -u tsuru-admin -p m0ir9ehynf
    - require:
      - file: /etc/tsuru/platforms-setup.js
      - pkg: mongodb-clients
