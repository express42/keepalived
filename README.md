# Description

Installs and configures keepalived

# Requirements

## Platform:

* Debian
* Ubuntu

## Cookbooks:

*No dependencies defined*

# Attributes

* `node['keepalived']['shared_address']` -  Defaults to `"true"`.
* `node['keepalived']['confpath']` -  Defaults to `"/etc/keepalived/conf.d/"`.
* `node['keepalived']['notification_emails']` -  Defaults to `"alert@test.local"`.
* `node['keepalived']['notification_email_from']` -  Defaults to `"alert@\#{node['domain'] || 'test.local'}"`.
* `node['keepalived']['smtp_server']` -  Defaults to `"127.0.0.1"`.
* `node['keepalived']['smtp_connect_timeout']` -  Defaults to `"30"`.
* `node['keepalived']['router_id']` -  Defaults to `"node['fqdn']"`.
* `node['keepalived']['router_ids']` -  Defaults to `"{ ... }"`.

# Recipes

* keepalived::default - Installs and configures keepalived.

# Resources

* [keepalived_check_script](#keepalived_check_script)
* [keepalived_clean](#keepalived_clean)
* [keepalived_virtual_server](#keepalived_virtual_server)
* [keepalived_vrrp](#keepalived_vrrp)

## keepalived_check_script

### Actions

- create:  Default action.

### Attribute Parameters

- script:
- interval:  Defaults to <code>5</code>.
- weight:  Defaults to <code>-2</code>.
- rise:  Defaults to <code>2</code>.
- fall:  Defaults to <code>2</code>.

## keepalived_clean

### Actions

- run:  Default action.

## keepalived_virtual_server

### Actions

- create:  Default action.

### Attribute Parameters

- vs_listen_ip:
- vs_listen_port:
- delay_loop:  Defaults to <code>15</code>.
- lb_algo:  Defaults to <code>"rr"</code>.
- lb_kind:  Defaults to <code>"nat"</code>.
- vs_protocol:  Defaults to <code>"tcp"</code>.
- real_servers:

## keepalived_vrrp

### Actions

- create:  Default action.

### Attribute Parameters

- interface:
- virtual_router_id:  Defaults to <code>10</code>.
- state:  Defaults to <code>"BACKUP"</code>.
- noprempt:  Defaults to <code>false</code>.
- priority:  Defaults to <code>100</code>.
- virtual_ipaddress:
- virtual_routes:
- advert_int:
- auth_type:
- auth_pass:
- track_interface:
- track_script:
- notify_master:
- notify_backup:
- notify_fault:

# License and Maintainer

Maintainer:: Express42 (<info@express42.com>)

License:: MIT
