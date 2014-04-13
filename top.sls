
base:
  '*':
    - core
  'mongo*':
    - mongodb-10gen
  'docker*':
    - hipache
    - tsuru.docker
  'tsuru*':
    - gandalf
    - git-daemon
    - tsuru
    - redis
    - beanstalkd
