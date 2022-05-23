set runtimepath^=~/.vim runtimepath+=~/.vim/after

" vim.g.mapleader = ","
let mapleader = ","

set termguicolors

lua require('plugins')

let &packpath = &runtimepath

source ~/.vimrc
