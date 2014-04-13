
base:
  '*':
    - core
  'mongo*':
    - mongodb-10gen
  'docker*':
    - tsuru.docker
  'tsuru*':
    - gandalf
    - git-daemon
    - tsuru
    - hipache
    - redis
    - beanstalkd
