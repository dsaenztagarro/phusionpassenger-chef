#
# Cookbook Name:: phusionpassenger
# Recipe:: default
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'apt-get update' do
  action :run
end

package 'apache2'

keyserver = node['phusionpassenger']['keyserver']
recv_keys = node['phusionpassenger']['recv_keys']

execute 'apt-key adv' do
  command "apt-key adv --keyserver #{keyserver} --recv-keys #{recv_keys}"
end

package %w(apt-transport-https ca-certificates)

execute 'add_apt_repository' do
  command "sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'"
end

execute 'apt-get update' do
  action :run
end

package 'libapache2-mod-passenger'

execute 'enable_passenger_apache_module' do
  command 'a2enmod passenger'
end

execute 'restart_apache' do
  command 'apachectl restart'
end
