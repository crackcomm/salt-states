
include:
  - git
  - git.user

/etc/init.d/git-daemon:
  file.symlink:
    - user: root
    - target: /lib/init/upstart-job

/etc/init/git-daemon.conf:
  file:
    - managed
    - user: root
    - source: salt://git-daemon/upstart.conf

git-daemon:
  service:
    - running
    - enable: True
    - require:
      - pkg: git
      - file: /etc/init.d/git-daemon
      - file: /etc/init/git-daemon.conf
