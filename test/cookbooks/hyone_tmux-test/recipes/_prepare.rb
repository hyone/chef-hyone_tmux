::Chef::Recipe.send(:include, HyoneTmux::Helper)

_user  = get_user(node)
_group = get_user(node)
_home  = _user == 'root' ? '/root' : "/home/#{_user}"


case
when platform?('ubuntu')
  include_recipe 'apt'
end

## user and group
user _user do
  home _home
  supports manage_home: true
  shell '/bin/bash'
  action [:create]
end

group _group do
  members [_user]
  action [:create]
end
