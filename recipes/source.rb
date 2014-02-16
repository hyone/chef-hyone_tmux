#
# Cookbook Name:: tmux::from_source
# Recipe:: from_source
#
# Copyright 2013, hyone
#
# All rights reserved - Do Not Redistribute
#

::Chef::Recipe.send(:include, HyoneTmux::Helper)

_user  = get_user(node)
_group = get_group(node)
_prefix  = node['hyone_tmux']['prefix']
_version = node['hyone_tmux']['version']
_libevent_version = node['hyone_tmux']['libevent_version']


include_recipe 'build-essential'

case node['platform_family']
when 'rhel', 'fedora'
  package 'ncurses-devel' do
    action :install
  end
when 'debian'
  package 'libncurses-dev' do
    action :install
  end
end


libevent = hyone_source_package 'libevent' do
  version _libevent_version
  source_url "https://github.com/downloads/libevent/libevent/libevent-#{_libevent_version}.tar.gz"
  user  _user if _user
  group _group if _group
  prefix_base _prefix if _prefix
  action [:install]
end


hyone_source_package 'tmux' do
  version _version
  source_url "http://downloads.sourceforge.net/tmux/tmux-#{_version}.tar.gz"
  user  _user if _user
  group _group if _group
  prefix_base _prefix if _prefix
  action [:install]

  major_version = node[:platform_version].split('.')[0]
  if node['platform'] == 'centos' and major_version == '5'
    configure_options <<-EOL
      CPPFLAGS="-I#{libevent.prefix}/include" \\
      LDFLAGS="-static -L#{libevent.prefix}/lib"
    EOL
  else
    configure_options <<-EOL
      CPPFLAGS="-I#{libevent.prefix}/include" \\
      LDFLAGS="-L#{libevent.prefix}/lib -Wl,-rpath=#{libevent.prefix}/lib"
    EOL
  end
end
