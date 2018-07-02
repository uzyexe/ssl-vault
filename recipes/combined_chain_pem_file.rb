# Creates combined chain PEM file.
#
# Recipe:: combined_chain_pem_file
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

  if vault_item.key?('chain_certificates') and vault_item['chain_certificates']

    combined_chain_pem_file = if node['ssl-vault']['combined_chain_pem_file']
      node['ssl-vault']['combined_chain_pem_file']
    else
      File.join(
        node['ssl-vault']['private_key_directory'],
        [cert_name, 'combined', 'pem'].join('.')
      )
    end

    template combined_chain_pem_file do
      source 'combined.pem.erb'
      owner 'root'
      group node['ssl-vault']['cert_group']
      mode '0440'
      variables(
        :certificate => vault_item['certificate'],
        :chain_certificates => vault_item['chain_certificates'],
        :key => vault_item['key']
      )
    end

    node.default['ssl-vault']['certificate'][cert_name]['combined_chain_pem_file'] = combined_chain_pem_file
  end
end
