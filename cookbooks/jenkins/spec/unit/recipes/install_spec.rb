require 'spec_helper.rb'

describe 'jenkins::install' do
  run_command
  let(:chef_run) do
    ChefSpec::ServerRunner.new do
      end.converge(described_recipe)
    end

  it 'should not have errors' do
    chef_run.converge(described_recipe)
    expect {chef_run}.to_not raise_error
  end
end
