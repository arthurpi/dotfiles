function fish_prompt
  set -l tomita_vi_mode "$TOMITA_VI"

  if test -z (string match -ri '^no|false|0$' $tomita_vi_mode)
    switch $fish_bind_mode
      case default
        set_color --bold red
        printf ':'
      case insert
        set_color --bold blue
        printf '+'
      case visual
        set_color --bold magenta
        printf 'v'
    end
    set_color normal
  end


	set_color $fish_color_cwd
  printf '%s' (basename (prompt_pwd))

  set_color normal
  printf '%s ' (__fish_git_prompt)

  set_color -o yellow
  printf '$ '
  set_color normal
end
