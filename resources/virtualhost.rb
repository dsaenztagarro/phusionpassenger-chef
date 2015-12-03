resource_name :passenger_virtualhost

default_action :create

property :server_name, String, required: true
property :application_path, String, required: true

action :enable do
  template "/etc/apache2/sites-available/#{server_name}.conf" do
    source 'virtualhost.conf.erb'
    variables server_name: server_name, application_path: application_path
  end

  execute 'enabling_site' do
    command "a2ensite #{server_name}"
  end

  execute 'restarting_apache' do
    command 'apachectl restart'
  end
end

