set runtimepath^=~/.vim runtimepath+=~/.vim/after

lua require('plugins')

let &packpath = &runtimepath

source ~/.vimrc
