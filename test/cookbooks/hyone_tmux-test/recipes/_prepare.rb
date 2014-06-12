::Chef::Recipe.send(:include, HyoneTmux::Helper)

_user  = get_user(node)
_group = get_user(node)
_home  = _user == 'root' ? '/root' : "/home/#{_user}"


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
