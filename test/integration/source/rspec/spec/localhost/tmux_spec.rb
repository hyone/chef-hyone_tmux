require 'spec_helper'

_version = '1.9'
_tmux = "/home/hoge/local/apps/tmux-#{_version}/bin/tmux"

describe file(_tmux) do
  it { should be_file }
  it { should be_executable }
end

command ("#{_tmux} -V") do
  it { should return_stdout /tmux/ }
end

describe file('/home/hoge/local/bin/tmux') do
  it { should be_file }
  it { should be_linked_to _tmux }
end
