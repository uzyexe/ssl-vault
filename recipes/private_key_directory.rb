# Creates private key directory.
#
# Recipe:: private_directory
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: The MIT License (MIT)
# Source:: https://github.com/onbeep-cookbooks/ssl-vault
#


directory node['ssl-vault']['private_key_directory'] do
  owner 'root'
  group 'root'
  mode '0700'
end
