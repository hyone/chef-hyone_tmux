::Chef::Recipe.send(:include, HyoneTmux::Helper)

_user  = get_user(node)
_group = get_user(node)
_home  = _user == 'root' ? '/root' : "/home/#{_user}"


# Generate locales to avoid warnings like:
# 'bash: warning: setlocale: LC_ALL: cannot change locale (ja_JP.UTF-8)'
case
when platform?('centos')
  execute 'generate locale' do
    command 'localedef -f UTF-8 -i ja_JP /usr/lib/locale/ja_JP.UTF-8'
    action [:run]
  end
when platform?('ubuntu')
  execute 'locale-gen' do
    command 'locale-gen ja_JP.UTF-8'
    action [:run]
  end
end

case
when platform?('ubuntu')
  include_recipe 'apt'
end

## user and group
# NOTE: execute these resoruces earlier than any other resources
#       (in resource compilation time)
user _user do
  home _home
  supports manage_home: true
  shell '/bin/bash'
  action [:nothing]
end.run_action(:create)

group _group do
  members [_user]
  action [:nothing]
end.run_action(:create)
