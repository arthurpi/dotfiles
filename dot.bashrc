# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-prompt.sh

alias ls="ls -hG --color"
alias l="ls -l --color"
alias la="ls -la --color"
alias vi="vim"

set -o vi

shopt -s checkwinsize

export _JAVA_AWT_WM_NONREPARENTING=1


export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

export PATH=$PATH:$GOBIN
export PATH=$PATH:$HOME/Binary
export PATH=$PATH:$HOME/bin
export PATH=$HOME/homebrew/bin:$PATH
export LD_LIBRARY_PATH=$HOME/homebrew/lib:$LD_LIBRARY_PATH

if test -f "$HOME/devel/fuchsia/scripts/fx-env.sh"; then
  source "$HOME/devel/fuchsia/scripts/fx-env.sh"
  fx-update-path
fi

bold=$(tput bold)
normal=$(tput sgr0)

PROMPT_COMMAND='__git_ps1 "\[\033[01;30m\]\u\[\033[00m\]¬\[${bold}\]\W\[${normal}\] " "\[\033[01;30m\]\$ \[\033[00m\]" "(%s) "'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
