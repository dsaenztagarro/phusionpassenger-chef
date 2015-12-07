#
# Cookbook Name:: phusionpassenger
# Recipe:: install_test
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'phusionpassenger::install'

passenger_site 'creating_site' do
  server_name 'myserver.test'
  document_root '/www/deploy/app/releases/current'
end

passenger_site 'enabling_site' do
  server_name 'myserver.test'
  action :enable
end
