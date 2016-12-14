# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls -hG --color=auto"
alias l="ls -l"
alias la="ls -la"
alias vi="vim"

set -o vi

shopt -s checkwinsize

eval $(thefuck --alias)
#export GEM_HOME=/home/rtur/.gem/ruby/2.3.0/bin/
export GEM_HOME=$(ruby -e 'print Gem.user_dir')/bin
export CROSS_GCC=$HOME/devel/shotscope-v2/stm32-devel/gcc-arm-none-eabi/bin
export PATH=$PATH:$GEM_HOME:$CROSS_GCC:$HOME/bin
export _JAVA_AWT_WM_NONREPARENTING=1

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1

source ~/.git-prompt.sh

#export PS1='\[\033[00;31m\]\u\[\033[01;30m\] \$> \[\033[00m\]'
#export PS1='\[\033[01;30m\]\$> \[\033[00m\]'

PROMPT_COMMAND='__git_ps1 "\[\033[01;30m\][\u]\[\033[00m\]¬\[$(tput bold)\]\[\033[38;5;137m\]\W$(tput sgr0)\] " "\[\033[01;30m\]\$ \[\033[00m\]" "%s "'
