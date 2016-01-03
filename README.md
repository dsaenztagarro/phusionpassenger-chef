[![Cookbook Version](https://img.shields.io/cookbook/v/phusionpassenger.svg)](https://community.opscode.com/cookbooks/phusionpassenger)
[![Build Status](https://travis-ci.org/dsaenztagarro/phusionpassenger-chef.svg?branch=master)](https://travis-ci.org/dsaenztagarro/phusionpassenger-chef)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/phusionpassenger-chef/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/phusionpassenger-chef)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/phusionpassenger-chef/badge.svg?branch=master&service=github)](https://coveralls.io/github/dsaenztagarro/phusionpassenger-chef?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/phusionpassenger-chef.svg)](https://gemnasium.com/dsaenztagarro/phusionpassenger-chef)

phusionpassenger Cookbook
=========================

Ultra lightweight cookbook for installing [Phusion Passenger 5](https://www.phusionpassenger.com/)

Requirements
------------

#### Platforms
- Ubuntu 14.04 LTS

#### Chef
- Chef 12.2.0

#### packages
- `phusionpassenger::default` - Installs Phusion Passenger

Attributes
----------

#### phusionpassenger::default

See `attributes/default.rb` for default values.

* `node['phusionpassenger']['keyserver']` - Key server url
* `node['phusionpassenger']['recv_keys']` - Key id

Resources
---------

Example creating a site

```ruby
passenger_site 'creating_site' do
  document_root '/var/www/application/releases/current'
  environment 'USER' => 'deployer', 'HOME' => '/home/deployer'
  server_name 'application.test'
  server_alias %w(www.application.test)
  user 'deployer'
end
```

Example enabling a site

```ruby
passenger_site 'enabling_site' do
  server_name 'application.test'
  action :enable
end
```

Usage
-----
#### phusionpassenger::default
Just include `phusionpassenger` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[phusionpassenger]"
  ]
}
```

Sharing
-------

```
knife cookbook site share "phusionpassenger" "Web Servers"
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: David Saenz Tagarro
