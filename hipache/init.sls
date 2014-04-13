
include:
  - node

git:
  pkg.installed

hipache:
  cmd.run:
    - name: npm install -g hipache
    - user: root
    - require:
      - pkg: git
