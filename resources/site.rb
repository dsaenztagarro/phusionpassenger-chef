resource_name :passenger_site

default_action :create

property :document_root, String
property :environment, Hash, required: true
property :server, String, required: true
property :user, String, required: true

action :create do
  cmd = login_shell('passenger-config about ruby-command',
                    user: user, environment: environment)
  ruby_command = cmd.stdout.match(/Command: (.*)\n/i).captures.first

  template "/etc/apache2/sites-available/#{server_name}.conf" do
    source 'virtualhost.conf.erb'
    cookbook 'phusionpassenger'
    variables(
      server_name: server_name,
      document_root: document_root || "/var/www/#{server_name}/public",
      ruby_command: ruby_command
    )
  end
end

action :enable do
  execute 'enabling_site' do
    command "a2ensite #{server_name}"
  end
end
