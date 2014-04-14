
git-user:
  group.present:
    - name: git
    - addusers:
      - git
  user.present:
    - name: git
    - home: /home/git
    - groups:
      - git

git-daemon-run:
  file.directory:
    - name: /home/git/.ssh
    - user: git
    - group: git
    - mode: 700
    - makedirs: True
  pkg:
    - installed

/etc/init.d/git-daemon:
  file.symlink:
    - user: root
    - target: /lib/init/upstart-job
  cmd.run:
    - user: root
    - name: rm -rf /etc/{service,sv}/git-daemon

/etc/init/git-daemon.conf:
  file:
    - managed
    - source: salt://git-daemon/upstart.conf

git-daemon:
  service:
    - running
    - enable: True
    - require:
      - pkg: git-daemon-run
      - file: /etc/init.d/git-daemon
      - file: /etc/init/git-daemon.conf
