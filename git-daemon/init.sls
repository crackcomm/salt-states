
git-daemon-run:
  user.present:
    - name: git
    - home: /home/git
    - groups:
      - git
  file.directory:
    - user: git
    - group: git
    - mode: 700
    - makedirs: True
  pkg:
    - installed
  service:
    - running
    - enable: True
    - require:
      - pkg: git-daemon-run
