
include:
  - node
  - git

install-hipache:
  cmd.run:
    - name: npm install -g hipache
    - user: root
    - require:
      - pkg: git

hipache:
  service:
    - running
    - enable: True
    - require:
      - file: /etc/init/hipache.conf
      - file: /etc/init.d/hipache

/etc/init/hipache.conf:
  file:
    - managed
    - user: root
    - source: salt://hipache/upstart.conf
    - skip_verify: True

/etc/init.d/hipache:
  file.symlink:
    - user: root
    - target: /lib/init/upstart-job

/etc/hipache.json:
  file:
    - managed
    - source: salt://hipache/config.json
    - skip_verify: True
    - template: jinja
    - context:
      REDIS_IP: 127.0.0.1
