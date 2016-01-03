resource_name :passenger_site

default_action :create

property :document_root, String
property :environment, Hash, required: true
property :server_name, String, required: true
property :server_alias, Array, default: []
property :user, String, required: true
property :friendly_error_pages, kind_of: [TrueClass, FalseClass], default: false

action :create do
  cmd = login_shell!('passenger-config about ruby-command',
                    user: user, environment: environment)
  ruby = cmd.stdout.match(/Command: (.*)\n/i).captures.first
  # application = server_name.tr('.', '_')

  %W(/var/log/apache2/#{application}_error.log
     /var/log/apache2/#{application}_access.log).each do |filepath|
    file filepath do
      owner user
      group 'www-data'
      action :touch
    end
  end

  template "/etc/apache2/sites-available/#{server_name}" do
    source 'virtualhost.conf.erb'
    cookbook 'phusionpassenger'
    variables(
      application: application,
      document_root: document_root || "/var/www/#{server_name}/current/public",
      friendly_error_pages: friendly_error_pages ? 'on' : 'off',
      ruby: ruby,
      server_name: server_name,
      server_alias: server_alias.join(' ')
    )
  end
end

action :enable do
  execute 'enabling_site' do
    command "a2ensite #{server_name}"
  end
end
