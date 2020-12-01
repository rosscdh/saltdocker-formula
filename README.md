# saltdocker-formula
Salt State to Install and Configure saltdocker https://min.io/

## Available states

- [`user`](#user)
- [`install`](#install)
- [`systemd`](#systemd)

### User
- Creates group for saltdocker
- Creates user for saltdocker

```yaml
saltdocker:
  user:
    name: saltdocker
  group:
    name: saltdocker
```

### Install
- Creates directories and give permissions for saltdocker user and group:
- installs gpg
- setups the saltmaster and alcali environment files

### Systemd
- Creates saltmaster, alcali, alcali-mariadb systems
- Creates and configure `/etc/default/saltdocker`
- Enables saltdocker services
- Starts saltdocker services


> **NOTE:** *browser* and *drive_sync* are there just for reference,
> as `on` and `off` are boolean keywords in yaml and it renders
> `True` and `False` instead.
