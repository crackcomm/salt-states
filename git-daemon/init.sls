
git-daemon-run:
  user.present:
    - name: git
    - home: /home/git
    - groups:
      - git
  file.directory:
    - name: /home/git/.ssh
    - user: git
    - group: git
    - mode: 700
    - makedirs: True
  pkg:
    - installed
