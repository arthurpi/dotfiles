# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind Space:magic-space

alias ls="ls -hp --color=always"
alias l="ls -l --color=always"
alias la="ls -la --color=always"

alias vi="nvim"
alias vim="nvim"

set -o vi
shopt -s checkwinsize

export EDITOR=vim

[[ -s "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"

bold=$(tput bold)
normal=$(tput sgr0)
PS1="\[\033[01;30m\]\u\[\033[00m\]¬\[${bold}\]\W\[${normal}\] \[\033[01;30m\]\$ \[\033[00m\]"
