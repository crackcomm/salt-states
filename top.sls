
base:
  '*':
    - core
  'mongo*':
    - mongodb-10gen
  'docker*':
    - docker
    - tsuru.docker
  'tsuru*':
    - gandalf
    - git-daemon
    - tsuru
    - redis
    - beanstalkd
