name             'ssl-vault'
maintainer       'Greg Albrecht'
maintainer_email 'gba@onbeep.com'
license          'MIT'
description      'SSL key & certificate storage in chef-vault.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

supports 'ubuntu'

depends 'chef-vault', '~> 1.0.4'
