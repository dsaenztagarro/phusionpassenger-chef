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
  environment 'USER' => 'deployer', 'HOME' => '/home/deployer'
  server_name 'myserver.test'
  server_alias %w(www.myserver.test)
  user 'deployer'
end

passenger_site 'enabling_site' do
  server_name 'myserver.test'
  action :enable
end
