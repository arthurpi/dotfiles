myinvokeman() {
  man $1 | less
}

alias ls="ls -hG"
alias l="ls -l"
alias la="ls -la"
alias vi="vim"
alias man=myinvokeman

set -o vi

export PS1='\[\033[00;31m\]\u\[\033[01;30m\] \$> \[\033[00m\]'
