
beanstalkd:
  pkg:
    - installed
  file:
    - managed
    - name: /etc/default/beanstalkd
    - source: salt://beanstalkd/beanstalkd.conf
  service:
    - running
    - enable: True
    - require:
      - pkg: beanstalkd
