
include:
  - beanstalkd
  - redis
  - git-daemon
  - gandalf
  - mongodb-10gen
  - hipache

mongo:
  service:
    - running
    - enable: True
    - require:
      - pkg: mongodb-10gen
