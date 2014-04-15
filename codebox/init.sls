
include:
  - node

make:
  pkg.installed

g++:
  pkg.installed

codebox:
  cmd.run:
    - user: root
    - name: npm install -g codebox
    - require:
      - archive: node      
      - pkg: make
      - pkg: g++
