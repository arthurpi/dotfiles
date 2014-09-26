# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls -hG --color=auto"
alias l="ls -l"
alias la="ls -la"
alias vi="vim"

set -o vi

export PS1='\[\033[00;31m\]\u\[\033[01;30m\] \$> \[\033[00m\]'
