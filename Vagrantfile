# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# Vagrantfile for ssl-vault Cookbook.
#
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: The MIT License (MIT)
# Source:: https://github.com/onbeep-cookbooks/ssl-vault
#


Vagrant.configure('2') do |config|
  config.vm.hostname = 'ssl-vault-cookbook'

  config.vm.box = 'opscode-ubuntu-12.04'
  config.vm.box_url = 'https://opscode-vm.s3.amazonaws.com/vagrant/' + 
    'opscode_ubuntu-12.04_provisionerless.box'

  config.ssh.max_tries = 40
  config.ssh.timeout = 120

  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision(:chef_solo) do |chef|
    chef.run_list = ['recipe[ssl-vault::default]']
  end
end
