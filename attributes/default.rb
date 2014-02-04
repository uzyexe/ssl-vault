# Default Attributes for ssl-vault.
#
# Attribute:: default
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: All rights reserved. Do not redistribute.
# Source:: https://github.com/OnBeep/cookbook-ssl-vault
#


default['ssl-vault']['certificates'] = {}

# These are currently Ubuntu-centric:
default['ssl-vault']['certificate_directory'] = '/etc/ssl/certs'
default['ssl-vault']['private_directory'] = '/etc/ssl/private'

# There's limits on Data Bag Key names:
default['ssl-vault']['data_bag_key_rex'] = /[^\-[:alnum:]_]+/
default['ssl-vault']['data_bag_key_replacement_str'] = '_'
