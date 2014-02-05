# Tests for ssh_keys Recipe.
#
#
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2013 OnBeep, Inc.
# License:: All rights reserved. Do not redistribute.
# Source:: https://github.com/OnBeep/cookbook-ssl-vault
#


require 'spec_helper'


test_cert = 'example.com'
ssl_directory = '/etc/ssl'

certificate_directory = File.join(ssl_directory, 'certs')
private_directory = File.join(ssl_directory, 'private')
certificate_file = File.join(
  certificate_directory, [test_cert, 'cert'].join('.'))
key_file = File.join(private_directory, [test_cert, 'key'].join('.'))
combined_chain_file = File.join(
  certificate_directory, [test_cert, 'combined', 'cert'].join('.'))
combined_chain_pem_file = File.join(
  private_directory, [test_cert, 'combined', 'pem'].join('.'))


describe file(ssl_directory) do
  it { should be_directory }
  it { should be_owned_by 'root' }
end

describe file(certificate_directory) do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 755 }
end

describe file(private_directory) do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 700 }
end

describe file(certificate_file) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file(key_file) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 400 }
end

describe file(combined_chain_file) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 644 }
end

describe file(combined_chain_pem_file) do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should be_mode 400 }
end
