# Default Include Recipe Requisites for ssl-vault.
#
# Recipe:: certs
# Cookbook:: ssl-vault
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: All rights reserved. Do not redistribute.
# Source:: https://github.com/OnBeep/cookbook-ssl-vault
#


node['ssl-vault']['certificates'].each do |cert_name, cert|
  clean_name = cert_name.gsub(
    node['ssl-vault']['data_bag_key_rex'], 
    node['ssl-vault']['data_bag_key_replacement_str']
  )
  vault_item = chef_vault_item('ssl-vault', clean_name)


  # Create private key:
  private_key = File.join(
    node['ssl-vault']['private_directory'],
    [cert_name, 'key'].join('.')
  )

  file private_key do
    content vault_item['key']
    owner 'root'
    group 'root'
    mode '0400'
  end


  # Create certificate file:
  cert_file = File.join(
    node['ssl-vault']['certificate_directory'],
    [cert_name, 'cert'].join('.')
  )

  file cert_file do
    content vault_item['certificate']
    owner 'root'
    group 'root'
    mode '0644'
  end
end
