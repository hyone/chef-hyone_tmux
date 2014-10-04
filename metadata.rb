name             'hyone_tmux'
maintainer       'hyone'
maintainer_email 'hyone.development@gmail.com'
license          'All rights reserved'
description      'Installs/Configures tmux'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'hyone_source_package'
depends          'build-essential'
depends          'yum-repoforge'

supports         'ubuntu', '12.04'
supports         'centos', ">= 6"
