require 'spec_helper'

_version = '1.9'
_user    = 'hoge'
_tmux    = "/home/#{_user}/local/apps/tmux-#{_version}/bin/tmux"


describe file(_tmux) do
  it { should be_file }
  it { should be_executable }
end

command ("#{_tmux} -V") do
  its(:stdout) { should match /tmux/ }
end

describe file("/home/#{_user}/local/bin/tmux") do
  it { should be_file }
  it { should be_linked_to _tmux }
end
