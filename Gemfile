source 'https://rubygems.org'

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.6.3"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

gem 'ipaddress', '~> 0.8.0'

# Fix compatible version issue for gem 'net-ssh'
# Bundler could not find compatible versions for gem "net-ssh":
#   In Gemfile:
#     net-ssh (= 3.0.1)
#
#     serverspec (~> 2.27.0) was resolved to 2.27.0, which depends on
#       specinfra (~> 2.46) was resolved to 2.47.1, which depends on
#         net-ssh (< 3.1, >= 2.7)
#
#     test-kitchen (~> 1.4.2) was resolved to 1.4.2, which depends on
#       net-ssh (< 2.10, ~> 2.7)
gem 'net-ssh', '2.7'

group :development do
  gem 'test-kitchen', '~> 1.4.2'
  gem 'kitchen-vagrant'
  gem 'serverspec', '~> 2.27.0'
end

# Executables provided by ChefDK
group :chef do
  gem 'berkshelf', '~> 4.0.1'
  gem 'chefspec', '~> 4.5.0'
  gem 'librarian-chef'
  gem 'foodcritic', '~> 5.0.0'
  gem 'rspec', '~> 3.4.0'
  gem 'rubocop', '~> 0.35.0'
end

group :test do
  gem 'reek', '~> 3.8.1'
  gem 'cane', '~> 2.6.2'
  gem 'coveralls', '~> 0.8.10'
  gem 'simplecov', '~> 0.11.0'
  gem 'simplecov-console', '~> 0.2.0'
end
