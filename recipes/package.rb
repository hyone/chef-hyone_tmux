case node['platform_family']
when 'rhel', 'fedora'
  include_recipe 'yum-repoforge'

  package 'tmux' do
    action :install
    options '--enablerepo=rpmforge'
  end
when 'debian'
  package 'tmux' do
    action :install
  end
end
