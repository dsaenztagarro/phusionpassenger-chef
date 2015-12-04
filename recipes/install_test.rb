#
# Cookbook Name:: phusionpassenger
# Recipe:: install_test
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'phusionpassenger::install'

passenger_virtualhost 'creating_vhost' do
  server_name 'myserver.test'
  application_path '/www/deploy/app/releases/current'
end

passenger_virtualhost 'enabling_vhost' do
  server_name 'myserver.test'
  action :enable
end
