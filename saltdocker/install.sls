{#
  Salt State to Install and Configure saltdocker
#}
{%- from "saltdocker/map.jinja" import config with context %}

saltdocker_python-pip:
  pkg.installed:
  - name: python-pip

saltdocker_install_docker:
  pip.installed:
  - name: docker
  - require:
    - pkg: python-pip

saltdocker_make_dirs:
  file.directory:
  - makedirs: True
  - names:
    - {{ config.location }}
    - {{ config.location }}/auth
    - {{ config.location }}/master.d
    - {{ config.location }}/pillar
    - {{ config.location }}/pki
    - {{ config.location }}/roster
    - {{ config.location }}/salt-master-cache/minions
    - {{ config.location }}/services
    - {{ config.location }}/states
    - {{ config.location }}/mariadb/data


{{ config.location }}/saltmaster.env:
  file.managed:
  - contents: |-
    {{ config.env.saltmaster }}

{{ config.location }}/alcali.env:
  file.managed:
  - contents: |-
    {{ config.env.alcali }}