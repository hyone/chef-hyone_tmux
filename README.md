# hyone_tmux cookbook

## Requirements

## Usage

```json
{
  "hyone_tmux": {
    "user": "vagrant",
    "libevent_version": "2.0.21-stable",
    "version": "1.8"
  },

  "run_list": [
    "recipe[hyone_tmux::source]"
  ]
}
```

## Recipes

## hyone_tmux::package

Install tmux from os package system
( Currently don't use attributes below )

## hyone_tmux::source

Build and install tmux from source distribution.
customizable by attributes like below.

# Attributes

- `node.hyone_tmux.user`: owner of installed tmux distribution

- `node.hyone_tmux.group`: group of installed tmux distribution

- `node.hyone_tmux.prefix_base`: base path of installed tmux distribution

    - application is installed to `"#{node.hyone_tmux.prefix_base}/apps/tmux-#{node.hyone_tmux.version}"`

    - and link to files `'bin/'` to `"#{node.hyone_tmux.prefix_base}/bin/"`

    - if `prefix_base` is not specified :

        - `node.hyone_tmux.user` is `'root'`, then prefix is `'/usr/local'`

        - `node.hyone_tmux.user` is non-root, then prefix is `"#{ENV['HOME']}/local"`

- `node.hyone_tmux.version`: installed tmux version

- `node.hyone_tmux.libevent_version`: installed libevent version

# Author

Author:: hyone (<hyone.development@gmail.com>)
