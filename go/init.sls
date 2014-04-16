
clean-go:
  pkg.purged:
    - pkgs:
      - golang-go

golang:
  archive:
    - extracted
    - user: root
    - name: /usr/local/
    - source: https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
    - source_hash: md5=683a18e2565b1b29933321852fb7bdb8
    - archive_format: tar
    - if_missing: /usr/local/go
    - tar_options: z

goroot:
  cmd.run:
    - user: root
    - name: echo "GOROOT=/usr/local/go" >> /etc/environment
    - unless: cat /etc/environment | grep "GOROOT"

gopath:
  file.directory:
    - name: /usr/local/src/go
    - makedirs: True
  cmd.run:
    - user: root
    - name: echo "GOPATH=/usr/local/src/go" >> /etc/environment &&
            echo "PATH=\${GOROOT}/bin:\${GOPATH}/bin:\${PATH}" >> /etc/environment
    - unless: cat /etc/environment | grep "GOPATH"
    - require:
      - cmd: goroot
