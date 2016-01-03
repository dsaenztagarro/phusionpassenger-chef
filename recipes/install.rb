#
# Cookbook Name:: phusionpassenger
# Recipe:: default
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'phusionpassenger::system_requirements'

keyserver = node['phusionpassenger']['keyserver']
recv_keys = node['phusionpassenger']['recv_keys']

execute 'downloading_public_key' do
  command "apt-key adv --keyserver #{keyserver} --recv-keys #{recv_keys}"
end

execute 'adding_passenger_apt_repository' do
  command "sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main > /etc/apt/sources.list.d/passenger.list'"
end

execute 'apt-get update' do
  action :run
end

package 'installing_passenger_apache_module' do
  package_name 'libapache2-mod-passenger'
end

execute 'enabling_passenger_apache_module' do
  command 'a2enmod passenger'
end

execute 'restarting_apache' do
  command 'apachectl restart'
end
