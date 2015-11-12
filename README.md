[![Build Status](https://travis-ci.org/dsaenztagarro/phusionpassenger-chef.svg?branch=master)](https://travis-ci.org/dsaenztagarro/phusionpassenger-chef)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/phusionpassenger-chef/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/phusionpassenger-chef)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/phusionpassenger-chef/badge.svg?branch=master&service=github)](https://coveralls.io/github/dsaenztagarro/phusionpassenger-chef?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/phusionpassenger-chef.svg)](https://gemnasium.com/dsaenztagarro/phusionpassenger-chef)

phusionpassenger Cookbook
=========================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### packages
- `toaster` - phusionpassenger needs toaster to brown your bagel.

Attributes
----------

#### phusionpassenger::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['phusionpassenger']['keyserver']</tt></td>
    <td>String</td>
    <td>key server</td>
    <td><tt>hkp://keyserver.ubuntu.com:80</tt></td>
  </tr>
  <tr>
    <td><tt>['phusionpassenger']['recv_keys']</tt></td>
    <td>String</td>
    <td>key server</td>
    <td><tt>561F9B9CAC40B2F7</tt></td>
  </tr>
</table>

Usage
-----
#### phusionpassenger::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `phusionpassenger` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[phusionpassenger]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
