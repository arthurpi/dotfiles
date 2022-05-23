set runtimepath^=~/.vim runtimepath+=~/.vim/after

let mapleader = ","

lua require('plugins')

let &packpath = &runtimepath

source ~/.vimrc
