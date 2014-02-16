module HyoneTmux
  module Helper

    def get_user(attr)
      attr['hyone_tmux']['user'] ||
        (attr.has_key?('main') && attr['main']['user']) ||
        'root'
    end

    def get_group(attr)
      attr['hyone_tmux']['group'] ||
        (attr.has_key?('main') && attr['main']['group']) ||
        get_user(attr)
    end
  end
end

