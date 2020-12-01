{#
  Salt State to Install and Configure saltdocker
#}
{%- from "saltdocker/map.jinja" import config with context %}

saltdocker_systemd_service:
  file.managed:
    - name: /etc/systemd/system/saltmaster.service
    - source: salt://{{ slspath }}/files/systemd/saltmaster.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        saltdocker_user: {{ config.user.name }}
        saltdocker_group: {{ config.group.name }}
        saltdocker_limit_nofile: {{ config.limit_nofile }}

alcali_systemd_service:
  file.managed:
    - name: /etc/systemd/system/alcali.service
    - source: salt://{{ slspath }}/files/systemd/alcali.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        saltdocker_user: {{ config.user.name }}
        saltdocker_group: {{ config.group.name }}
        saltdocker_limit_nofile: {{ config.limit_nofile }}

alcali_mariadb_systemd_service:
  file.managed:
    - name: /etc/systemd/system/alcali-mariadb.service
    - source: salt://{{ slspath }}/files/systemd/alcali.mariadb.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - context:
        saltdocker_user: {{ config.user.name }}
        saltdocker_group: {{ config.group.name }}
        saltdocker_limit_nofile: {{ config.limit_nofile }}


saltdocker_enable_service:
  service.enabled:
    - name: saltdocker

saltdocker_start_service:
  service.running:
    - name: saltdocker
