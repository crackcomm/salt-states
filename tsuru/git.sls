
/home/git/bare-template:
  file.recurse:
    - user: git
    - group: git
    - source: salt://tsuru/bare-template
    - file_mode: 755

tsuru-host-env:
  cmd.run:
    - user: root
    - name: echo "TSURU_HOST=\"http://127.0.0.1:8080\"" >> /etc/environment
    - unless: cat /etc/environment | grep "TSURU_HOST"

tsuru-token-env:
  cmd.run:
    - user: root
    - name: echo "TSURU_TOKEN=`tsr token`" >> /etc/environment
    - unless: cat /etc/environment | grep "TSURU_TOKEN"
    - require:
      - cmd: tsuru-token