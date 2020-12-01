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

alcali_systemd_service:
  file.managed:
    - name: /etc/systemd/system/alcali.service
    - source: salt://{{ slspath }}/files/systemd/alcali.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

alcali_mariadb_systemd_service:
  file.managed:
    - name: /etc/systemd/system/alcali-mariadb.service
    - source: salt://{{ slspath }}/files/systemd/alcali.mariadb.service.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644

{% for service in ["alcali-mariadb", "saltmaster", "alcali"] %}
{{ service }}_enable_service:
  service.enabled:
    - name: {{ service }}

{{ service }}_start_service:
  service.running:
    - name: {{ service }}
{% endfor %}