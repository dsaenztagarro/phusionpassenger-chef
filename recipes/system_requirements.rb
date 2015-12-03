#
# Cookbook Name:: phusionpassenger
# Recipe:: system_requirements
#
# Copyright 2015, David Saenz Tagarro
#
# All rights reserved - Do Not Redistribute
#

execute 'apt-get update' do
  action :run
end

package 'apache2'

package 'adding_https_support_apt' do
  package_name %w(apt-transport-https ca-certificates)
end

