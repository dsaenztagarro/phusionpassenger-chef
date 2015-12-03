name             'phusionpassenger'
maintainer       'David Saenz Tagarro'
maintainer_email 'david.saenz.tagarro@gmail.com'
license          'All rights reserved'
description      'Installs/Configures phusionpassenger'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe 'phusionpassenger::default', 'Installs Phusion Passenger'

%w(debian ubuntu).each { |os| supports os }

source_url 'https://github.com/dsaenztagarro/phusionpassenger' if respond_to?(:source_url)
issues_url 'https://github.com/dsaenztagarro/phusionpassenger/issues' if respond_to?(:issues_url)
