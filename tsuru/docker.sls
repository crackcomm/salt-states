
include:
  - docker

docker:
  service:
    - running
    - enable: True
    - require:
      - pkg: lxc-docker

tsuru-platforms:
  file:
    - managed
    - name: /etc/tsuru/platforms-setup.js
    - source: salt://tsuru/platforms-setup.js
    - skip_verify: True
  cmd.run:
    - name: cat /etc/tsuru/platforms-setup.js | mongo tsuru

{% for platform in ['go', 'nodejs', 'php', 'python', 'ruby', 'static'] %}
tsuru-docker-platform-{{platform}}:
  cmd.run:
    - user: root
    - name: docker build -t tsuru/{{platform}} https://raw.github.com/tsuru/basebuilder/master/{{platform}}/Dockerfile
    - require:
      - pkg: lxc-docker
{% endfor %}
