set runtimepath^=~/.vim runtimepath+=~/.vim/after

lua require('plugins')
lua require('configs/neo-tree')

let &packpath = &runtimepath

source ~/.vimrc
