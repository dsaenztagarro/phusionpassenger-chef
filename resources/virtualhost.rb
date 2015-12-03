resource_name :passenger_virtualhost

default_action :create

property :server_name, String, required: true
property :application_path, String

action :create do
  cmd = shell_out('passenger-config about ruby-command')
  ruby_command = cmd.stdout.match(/Command: (.*)\n/i).captures.first
  log "ruby_command: #{ruby_command}" do
    level :debug
  end

  virtualhost_variables = {
    server_name: server_name,
    application_path: application_path,
    ruby_command: ruby_command
  }

  template "/etc/apache2/sites-available/#{server_name}.conf" do
    source 'virtualhost.conf.erb'
    variables virtualhost_variables
  end
end

action :enable do
  execute 'enabling_site' do
    command "a2ensite #{server_name}"
  end

  execute 'restarting_apache' do
    command 'apachectl restart'
  end
end

