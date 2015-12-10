resource_name :passenger_site

default_action :create

property :document_root, String
property :environment, Hash, required: true
property :server, String, required: true
property :user, String, required: true
property :friendly_error_pages, kind_of: [TrueClass, FalseClass], default: false

action :create do
  cmd = login_shell('passenger-config about ruby-command',
                    user: user, environment: environment)
  ruby = cmd.stdout.match(/Command: (.*)\n/i).captures.first
  application = server.gsub '.', '_'

  %W(/var/log/apache2/#{application}_error.log
     /var/log/apache2/#{application}_access.log).each do |filepath|
    file filepath do
      owner user
      group 'www-data'
      action :touch
    end
  end

  template "/etc/apache2/sites-available/#{server}.conf" do
    source 'virtualhost.conf.erb'
    cookbook 'phusionpassenger'
    variables(
      application: application,
      document_root: document_root || "/var/www/#{server}/current/public",
      friendly_error_pages: friendly_error_pages ? 'on' : 'off',
      ruby: ruby,
      server: server
    )
  end
end

action :enable do
  execute 'enabling_site' do
    command "a2ensite #{server}"
  end
end
