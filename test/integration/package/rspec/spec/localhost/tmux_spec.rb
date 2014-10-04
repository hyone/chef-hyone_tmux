require 'spec_helper'


describe command('tmux -V') do
  its(:exit_status) { should eq 0 }
end
