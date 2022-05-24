set runtimepath^=~/.vim runtimepath+=~/.vim/after

" vim.g.mapleader = ","
let mapleader = ","

set termguicolors
set signcolumn=auto:4                   " enough to show git st and diagnostics

lua require('plugins')

let &packpath = &runtimepath

source ~/.vimrc
