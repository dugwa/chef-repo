require 'chefspec'
require 'chefspec/berkshelf'

def run_command
  before(:each) do
    stub_command("ps -ef |pgrep java").and_return(false)
  end
end

at_exit { ChefSpec::Coverage.report! }
