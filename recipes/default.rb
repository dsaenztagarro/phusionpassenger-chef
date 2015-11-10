#
# Cookbook Name:: phusionpassenger
# Recipe:: default
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

apt_get 'apt_get_update' do
  action :update
end

package 'apache2'

apt_key 'apt_key_adv' do
  action :adv
  keyserver node['phusionpassenger']['keyserver']
  recv_keys node['phusionpassenger']['recv_keys']
end

apt_get 'apt_get_install' do
  action :install
  packages %w(apt-transport-https ca-certificates)
end

execute 'add_apt_repository' do
  command "sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'"
end

apt_get 'apt_get_update' do
  action :update
end
