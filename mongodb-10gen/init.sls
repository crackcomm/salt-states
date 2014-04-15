
include:
  - mongodb-10gen.repo

mongodb-10gen:
  pkg:
    - installed
    - require:
      - cmd: mongodb-repo

mongodb:
  service:
    - running
    - enable: True
    - require:
      - pkg: mongodb-10gen
