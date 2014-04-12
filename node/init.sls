{% set node_version = '0.10.26' %}

node:
  archive:
    - extracted
    - user: root
    - name: /usr/local/src
    - source: http://nodejs.org/dist/v{{node_version}}/node-v{{node_version}}-linux-x64.tar.gz
    - source_hash: md5=5d41f981ed3bca6cebd4cfc4444537f1
    - archive_format: tar
    - if_missing: /usr/local/src/node-v{{node_version}}-linux-x64
    - tar_options: z

/usr/local/bin/node:
  file.symlink:
    - user: root
    - target: /usr/local/src/node-v{{node_version}}-linux-x64/bin/node
    - force: True

/usr/local/bin/npm:
  file.symlink:
    - user: root
    - target: /usr/local/src/node-v{{node_version}}-linux-x64/bin/npm
    - force: True
