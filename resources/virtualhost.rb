resource_name :passenger_virtualhost

default_action :create

property :server_name, String, required: true
property :user_name, String, required: true
property :document_root, String

action :create do
  cmd = login_shell('passenger-config about ruby-command', user: user_name)
  ruby_command = cmd.stdout.match(/Command: (.*)\n/i).captures.first

  template "/etc/apache2/sites-available/#{server_name}.conf" do
    source 'virtualhost.conf.erb'
    cookbook 'phusionpassenger'
    variables({
      server_name: server_name,
      document_root: document_root,
      ruby_command: ruby_command
    })
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
