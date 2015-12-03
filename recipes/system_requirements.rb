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

package %w(apache2 apt-transport-https ca-certificates)
