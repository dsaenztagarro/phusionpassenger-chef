property :server_name, String, default: ''
property :application_path, String, default: ''

action :enable do
  template "/etc/apache2/sites-available/#{server_name}.conf" do
    source 'virtualhost.conf.erb'
    variables { server_name: server_name, application_path: application_path }
  end

  execute 'enable_site' do
    command "a2ensite #{server_name}"
  end
end
