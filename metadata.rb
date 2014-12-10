name             'keepalived'
maintainer       'LLC Express 42'
maintainer_email 'cookbooks@express42.com'
license          'MIT'
description      'Installs and configures keepalived'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.5'

recipe           'keepalived::default', 'Installs and configures keepalived.'

supports         'debian'
supports         'ubuntu'
