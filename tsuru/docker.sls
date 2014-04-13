
include:
  - docker

{# {% for platform in ['go', 'nodejs', 'php', 'python', 'ruby', 'static'] %} #}
{% for platform in ['static'] %}
tsuru-docker-platform-{{platform}}:
  cmd.run:
    - user: root
    - env:
      - DOCKER_HOST: 127.0.0.1:4243
    - name: docker build -t tsuru/{{platform}} https://raw.github.com/tsuru/basebuilder/master/{{platform}}/Dockerfile
    - require:
      - pkg: lxc-docker
{% endfor %}
