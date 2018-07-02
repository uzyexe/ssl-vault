# Creates PEM file.
#
# Recipe:: pem_file
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: The MIT License (MIT)
# Source:: https://github.com/onbeep-cookbooks/ssl-vault
#


include_recipe 'chef-vault'
include_recipe 'ssl-vault::private_key_directory'


node['ssl-vault']['certificates'].each do |cert_name, cert|
  clean_name = cert_name.gsub(
    node['ssl-vault']['data_bag_key_rex'],
    node['ssl-vault']['data_bag_key_replacement_str']
  )
  vault_item = chef_vault_item('ssl-vault', clean_name)

  pem_file = if node['ssl-vault']['pem_file']
    node['ssl-vault']['pem_file']
  else
    File.join(
      node['ssl-vault']['private_key_directory'],
      [cert_name, 'pem'].join('.')
    )
  end

  template pem_file do
    source 'pem.erb'
    owner 'root'
    group node['ssl-vault']['cert_group']
    mode '0440'
    variables(
      :key => vault_item['key'],
      :certificate => vault_item['certificate']
    )
  end

  node.default['ssl-vault']['certificate'][cert_name]['pem_file'] = pem_file
end
