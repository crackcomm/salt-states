# Tsuru configuration file
#   /etc/tsuru/tsuru.conf

/etc/tsuru/tsuru.conf:
  file:
    - managed
    - source: salt://tsuru/tsuru.conf
    - skip_verify: True
    - template: jinja
    - context:
      MONGO_URI: mongodb://user:pass@localhost/tsuru
      DOCKER_HOST: 127.0.0.1:4243
      TSURU_DOMAIN: localhost
      GANDALF_HOST: localhost
      BEANSTALKD_IP: 127.0.0.1
      REDIS_IP: 127.0.0.1
