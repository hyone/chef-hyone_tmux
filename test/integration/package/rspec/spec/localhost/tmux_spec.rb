require 'spec_helper'


describe command('tmux -V') do
  it { should return_exit_status 0 }
end
