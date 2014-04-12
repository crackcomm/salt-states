
etcd:
  archive:
    - extracted
    - user: root
    - name: /usr/local/
    - source: https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
    - source_hash: md5=683a18e2565b1b29933321852fb7bdb8
    - archive_format: tar
    - if_missing: /usr/local/go
    - tar_options: z

/usr/local/bin/go:
  file.symlink:
    - user: root
    - target: /usr/local/go/bin/go
    - force: True
https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz