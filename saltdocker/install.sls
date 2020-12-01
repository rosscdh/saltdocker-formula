{#
  Salt State to Install and Configure saltdocker
#}
{%- from "saltdocker/map.jinja" import config with context %}

gpg:
  pkg.installed

saltdocker_make_dirs:
  file.directory:
  - makedirs: True
  - user: {{ config.user.name }}
  - group: {{ config.group.name }}
  - mode: 644
  - names:
    - {{ config.location }}
    - {{ config.location }}/auth
    - {{ config.location }}/master.d/gpgkeys
    - {{ config.location }}/pillar
    - {{ config.location }}/pki
    - {{ config.location }}/roster
    - {{ config.location }}/salt-master-cache/minions
    - {{ config.location }}/services
    - {{ config.location }}/states
    - {{ config.location }}/mariadb/data


{{ config.location }}/saltmaster.env:
  file.managed:
  - contents_pillar: saltdocker:env:saltmaster

{{ config.location }}/alcali.env:
  file.managed:
  - contents_pillar: saltdocker:env:alcali
