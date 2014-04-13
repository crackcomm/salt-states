mongodb-10gen:
{% if grains['os'] == 'Ubuntu' %}
  cmd.run:
    - name: sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    - unless: apt-key list | grep -q 7F0CEB10
    - require:
      - file: /etc/apt/sources.list.d/10gen.list
  file:
    - managed
    - name: /etc/apt/sources.list.d/10gen.list
    - source: salt://mongodb-10gen/10gen.list
{% elif grains['os_family'] == 'RedHat' %}
  file:
    - managed
    - name: /etc/yum.repos.d/10gen.repo
    - source: salt://mongodb-10gen/10gen.repo
{% endif %}
    - skip_verify: True
  pkg:
    - installed
    - refresh: True
