# Creates certificate_directory and private_directory for SSL certs.
#
# Recipe:: directories
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: All rights reserved. Do not redistribute.
# Source:: https://github.com/OnBeep/cookbook-ssl-vault
#


directory node['ssl-vault']['certificate_directory'] do
  recursive true
  owner 'root'
  group 'root'
  mode '0755'
end

directory node['ssl-vault']['private_directory'] do
  owner 'root'
  group 'root'
  mode '0700'
end
