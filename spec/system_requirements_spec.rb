require 'spec_helper'

describe 'phusionpassenger::system_requirements' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['phusionpassenger']['keyserver'] = 'hkp://keyserver.ubuntu.com:80'
      node.set['phusionpassenger']['recv_keys'] = '561F9B9CAC40B2F7'
    end.converge described_recipe
  end

  it 'runs a execute with apt-get update' do
    expect(chef_run).to run_execute('apt-get update')
  end

  it 'installs a package with apache2' do
    expect(chef_run).to install_package('apache2')
  end

  it 'installs a package when adding https support for apt' do
    expect(chef_run).to install_package('adding_https_support_apt')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
