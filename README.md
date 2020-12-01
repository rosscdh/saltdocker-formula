# saltdocker-formula
Salt State to Install and Configure saltdocker https://min.io/

## Available states

- [`user`](#user)
- [`install`](#install)
- [`log`](#log)
- [`systemd`](#systemd)

### User
- Creates group for saltdocker
- Creates user for saltdocker

```yaml
saltdocker:
  user: saltdocker
  group: saltdocker
  uid: 900
  gid: 900
```

### Install
- Creates directories and give permissions for saltdocker user and group:
  - /etc/saltdocker
  - /etc/saltdocker/certs
- Downloads saltdocker release binary
- Verifies saltdocker binary integrity
- Installs the binary in the configured path

```yaml
saltdocker:
  user: saltdocker
  group: saltdocker
  release: saltdocker.RELEASE.2019-04-18T21-44-59Z
  platform: linux-amd64
  download_url: https://dl.min.io/server/saltdocker/release/
  install_path: /usr/local/bin/
```

### Log

- Creates the log file and give permissions for saltdocker user and group:

```yaml
saltdocker:
  user: saltdocker
  group: saltdocker
  http_trace: /var/log/saltdocker.log
```

### Systemd
- Creates saltdocker.service file
- Creates and configure `/etc/default/saltdocker`
- Enables saltdocker service
- Starts saltdocker service

```yaml
saltdocker:
  user: saltdocker
  group: saltdocker
  limit_nofile: 65536
  access_key: AKIAIOSFODNN7EXAMPLE
  secret_key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
  volumes: http://node{1...6}/export{1...32}
  browser: off
  drive_sync: on
  http_trace: /var/log/saltdocker/saltdocker.log
  port: 9000
```

> **NOTE:** *browser* and *drive_sync* are there just for reference,
> as `on` and `off` are boolean keywords in yaml and it renders
> `True` and `False` instead.
