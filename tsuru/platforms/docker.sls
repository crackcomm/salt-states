# Setup's platforms on Docker provisioner

include:
  - docker

{% for platform in ['go', 'nodejs', 'php', 'python', 'ruby', 'static'] %}
tsuru-docker-platform-{{platform}}:
  cmd.run:
    - user: root
    - env:
      - DOCKER_HOST: 127.0.0.1:4243
    - name: docker build -t tsuru/{{platform}} https://raw.github.com/crackcomm/basebuilder/master/{{platform}}/Dockerfile
    - require:
      - pkg: lxc-docker
{% endfor %}
