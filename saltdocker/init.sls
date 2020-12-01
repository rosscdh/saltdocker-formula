{#
  Salt State to Install and Configure saltdocker
#}
{%- from "saltdocker/map.jinja" import config with context %}

include:
  - saltdocker.user
  - saltdocker.install
  - saltdocker.systemd
