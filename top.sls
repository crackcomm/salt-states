
base:
  '*':
    - core
  'mongo*':
    - mongodb-10gen
  'docker*':
    - docker
    - tsuru.docker
  'tsuru*':
    - git-daemon
    - gandalf
    - tsuru
    - redis
    - beanstalkd
