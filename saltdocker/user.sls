{#
  Salt State to Install and Configure saltdocker
#}
{%- from "saltdocker/map.jinja" import config with context %}

saltdocker_group:
  group.present:
    - name: {{ config.group.name }}

saltdocker_user:
  user.present:
    - name: {{ config.user.name }}
    - shell: /sbin/nologin
    - groups:
      - {{ config.group.name }}
