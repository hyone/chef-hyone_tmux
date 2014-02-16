require 'spec_helper'

_tmux = '/home/hoge/local/apps/tmux-1.8/bin/tmux'

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
