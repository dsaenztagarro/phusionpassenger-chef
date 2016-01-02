name             'phusionpassenger'
maintainer       'David Saenz Tagarro'
maintainer_email 'david.saenz.tagarro@gmail.com'
license          'All rights reserved'
description      'Installs Phusion Passenger 5+'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

recipe 'phusionpassenger::default', 'Installs Phusion Passenger'
recipe 'phusionpassenger::install', 'Installs Phusion Passenger'

%w(debian ubuntu).each { |os| supports os }

source_url 'https://github.com/dsaenztagarro/phusionpassenger-chef' if respond_to?(:source_url)
issues_url 'https://github.com/dsaenztagarro/phusionpassenger-chef/issues' if respond_to?(:issues_url)
