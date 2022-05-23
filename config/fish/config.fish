set fish_greeting

if status is-interactive

    # note: this erases the default fish_mode_prompt, which adds a vi mode
    # indicator to the left of your prompt
    function fish_mode_prompt; end

    # Commands to run in interactive sessions can go here
    set fish_key_bindings fish_user_key_bindings

end
