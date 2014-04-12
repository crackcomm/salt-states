
include:
  - beanstalkd
  - redis
  - git-daemon
  - gandalf
  - mongodb-10gen
  - hipache

mongodb-10gen:
  service:
    - running
    - enable: True
    - require:
      - pkg: mongodb-10gen
