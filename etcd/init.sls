
etcd:
  archive:
    - extracted
    - user: root
    - name: /usr/local/src
    - source: https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz
    - source_hash: md5=48c3b9b0a425ae2a3b7bfa1fceb972a0
    - archive_format: tar
    - if_missing: /usr/local/src/etcd-v0.3.0-linux-amd64
    - tar_options: z

/usr/local/bin/etcd:
  file.symlink:
    - user: root
    - target: /usr/local/src/etcd-v0.3.0-linux-amd64/etcd
    - force: True
