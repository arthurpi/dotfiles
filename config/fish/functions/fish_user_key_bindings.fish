function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jj backward-char force-repaint
    bind -M insert -m default kk backward-char force-repaint
    for mode in insert default visual
        bind -M $mode \cf forward-char
    end
end
