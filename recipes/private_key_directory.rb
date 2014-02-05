# Creates private key directory.
#
# Recipe:: private_directory
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: All rights reserved. Do not redistribute.
# Source:: https://github.com/OnBeep/cookbook-ssl-vault
#


directory node['ssl-vault']['private_key_directory'] do
  owner 'root'
  group 'root'
  mode '0700'
end
