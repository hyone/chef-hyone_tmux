
case node['platform_family']
when 'rhel', 'fedora'
  major_version = node['platform_version'].split('.').first.to_i
  if node['platform'] == 'centos' and major_version < 7
      include_recipe 'yum-repoforge'

      package 'tmux' do
        action :install
        options '--enablerepo=rpmforge'
      end
  else
    package 'tmux' do
      action :install
    end
  end
when 'debian'
  package 'tmux' do
    action :install
  end
end
