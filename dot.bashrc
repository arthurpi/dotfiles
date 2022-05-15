# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind Space:magic-space

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  alias ls="ls -hG"
  alias l="ls -l"
  alias la="ls -la"
else
  alias ls="ls -hG --color"
  alias l="ls -l --color"
  alias la="ls -la --color"
fi

alias vi="nvim"
alias vim="nvim"

set -o vi
shopt -s checkwinsize

[[ -s "$HOME/.bashrc.local" ]] && source "$HOME/.bashrc.local"

bold=$(tput bold)
normal=$(tput sgr0)
PS1="\[\033[01;30m\]\u\[\033[00m\]¬\[${bold}\]\W\[${normal}\] \[\033[01;30m\]\$ \[\033[00m\]"
