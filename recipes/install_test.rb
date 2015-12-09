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
  document_root '/var/www/application/current/public'
  environment 'USER' => 'deployer', 'HOME' => '/home/deployer'
  server 'myserver.test'
  user 'deployer'
end

passenger_site 'enabling_site' do
  server 'application.test'
  action :enable
end
