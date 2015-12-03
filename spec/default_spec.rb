require 'spec_helper'

describe 'phusionpassenger::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04') do |node|
      node.set['phusionpassenger']['keyserver'] = 'hkp://keyserver.ubuntu.com:80'
      node.set['phusionpassenger']['recv_keys'] = '561F9B9CAC40B2F7'
    end.converge described_recipe
  end

  it 'includes the `install` recipe' do
    expect(chef_run).to include_recipe('phusionpassenger::install')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
