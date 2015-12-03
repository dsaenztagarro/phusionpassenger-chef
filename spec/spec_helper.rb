require 'chefspec'
require 'chefspec/berkshelf'
require 'simplecov'
require 'simplecov-console'
require 'coveralls'

formatters = [Coveralls::SimpleCov::Formatter,
              SimpleCov::Formatter::HTMLFormatter,
              SimpleCov::Formatter::Console]

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)
SimpleCov.minimum_coverage(100)
SimpleCov.start

at_exit { ChefSpec::Coverage.report! }
