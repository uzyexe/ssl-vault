# Creates certificate directory.
#
# Recipe:: certificate_directory
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: The MIT License (MIT)
# Source:: https://github.com/OnBeep/cookbook-ssl-vault
#


directory node['ssl-vault']['certificate_directory'] do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
end
