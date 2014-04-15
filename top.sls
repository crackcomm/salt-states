
base:
  '*':
    - core
  'tsuru*':
    # Tsuru
    - tsuru
    # Provisioning
    - docker
    - tsuru.platforms
    # HTTP proxy
    - hipache
    # Git
    - git-daemon
    - gandalf
    - tsuru.git
    # Queues
    - beanstalkd
    - redis
    # MongoDB
    - mongodb-10gen
    # or use mongolab