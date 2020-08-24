# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

alias vi="vim"

set -o vi

shopt -s checkwinsize

export _JAVA_AWT_WM_NONREPARENTING=1


export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1


export PATH=$PATH:$HOME/Binary:$HOME/bin

export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH
export PATH=$HOME/homebrew/bin:$PATH

source ~/.git-prompt.sh

bold=$(tput bold)
normal=$(tput sgr0)

PROMPT_COMMAND='__git_ps1 "\[\033[01;30m\]\u\[\033[00m\]¬\[${bold}\]\W\[${normal}\] " "\[\033[01;30m\]\$ \[\033[00m\]" "(%s) "'
