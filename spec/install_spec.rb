require 'spec_helper'

describe 'phusionpassenger::install' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['phusionpassenger']['keyserver'] = 'hkp://keyserver.ubuntu.com:80'
      node.set['phusionpassenger']['recv_keys'] = '561F9B9CAC40B2F7'
    end.converge described_recipe
  end

  it 'includes the `system_requirements` recipe' do
    expect(chef_run).to include_recipe('phusionpassenger::system_requirements')
  end

  it 'runs a execute when downloading public key' do
    expect(chef_run).to run_execute('downloading_public_key')
  end

  it 'runs a execute when adding passenger apt repository' do
    expect(chef_run).to run_execute('adding_passenger_apt_repository')
  end

  it 'installs a package when installing passenger apache module' do
    expect(chef_run).to install_package('installing_passenger_apache_module')
  end

  it 'runs a execute when enabling passenger apache module' do
    expect(chef_run).to run_execute('enabling_passenger_apache_module')
  end

  it 'runs a execute when restarting apache' do
    expect(chef_run).to run_execute('restarting_apache')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
