" vim configuration file

set nocompatible
filetype off

" plugins {{{
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'

"plugins
Plugin 'morhetz/gruvbox'

call vundle#end()
" }}}

" filetype settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" apply the notes filetype
autocmd BufNewFile,BufRead *.notes set filetype=notes
" }}}

filetype plugin indent on
syntax on

" general options {{{
set mouse=a                             " mouse support (in any mode)
set formatoptions+=j                    " remove comment char when J
set shortmess+=A                        " disable swap warning
set encoding=utf-8                      " character encoding
set t_Co=256                            " enable 256bits color
set display=uhex                        " print hex value of non-printable chars
set scrolloff=10                        " leave at least 10 lines below cursor
set autoread                            " watch external file changes
set number                              " display line number
set cursorline                          " highlight current line
set showcmd                             " display cmd info
set noshowmode                          " hide current mode
set novisualbell                        " disable annoying screen flashes
set vb t_vb=                            " disable annoying bell
set backspace=indent,eol,start          " allow backspace everywhere
set laststatus=2                        " always display bottom status bar
set fdm=manual                          " folding method
set list                                " display invisible char
set listchars=eol:¬,tab:▸\ ,trail:.     " symbol to display
set fillchars=fold:\                    " no trailing chars for folded blocks
let &colorcolumn="81"                   " by default, highlight 81st column
" }}}

" color settings {{{
" override invisible char color
hi SpecialKey ctermbg=234 guifg=#649A9A

" override column color
highlight ColorColumn ctermbg=234 guibg=#2c2d27

" override folding highlight
highlight Folded ctermbg=234
" }}}

" default indentations & tabs {{{
set autoindent                          "keep indentation from the line above
set smartindent                         "extend indentation (C-like)
set shiftwidth=4                        "4 spaces indentation
set tabstop=4                           "sizeof tabs
set softtabstop=4                       "sizeof softtabs
set expandtab                           "replace tab with spaces
autocmd VimResized * execute "normal \<c-w>="
" }}}

" search {{{
set hlsearch                            "highligh search result
set incsearch                           "browser-like searches
set ignorecase                          "case insensitive
set smartcase                           "(unless there's uppercase char in search)
set magic                               "for regexp
set showmatch                           "highlight braces
" }}}

" auto completion menu {{{
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn,.hg
set wildignore+=.exe,.o,.out,.so,.a
" }}}

" history & backup directories {{{
set viminfo=""      "disable viminfo file
set backup
set undofile
set swapfile
" }}}

" general shortcuts {{{
let mapleader = ","

" edit/source .vimrc
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" clear search results
nnoremap <Leader>s      :let @/ = ""<CR>

" select all
nnoremap <Leader>a      ggVG

" search selected text block (visual mode)
vnoremap <Leader>sb     y/<C-r>"<CR>

" delete trailing spaces/tabs
nnoremap <Leader>x      :%s/\s\+$//e<CR>

" save current file with root privileges
cnoremap w!! w !sudo tee % >/dev/null

" }}}

" remap existing bindings {{{
nnoremap <C-k>          {
nnoremap <C-j>          }
vnoremap <C-k>          {
vnoremap <C-j>          }
nnoremap H              :tabprev<CR>
nnoremap L              :tabnext<CR>
vnoremap H              :tabprev<CR>
vnoremap L              :tabnext<CR>
vnoremap <              <gv
vnoremap >              >gv
nnoremap ;              :
vnoremap ;              :
" exit insert mode with jj strokes
inoremap jj             <Esc>
" }}}

" plugin configurations {{{

" gruvbox {{{
let g:gruvbox_contrast_dark = 'dark'
autocmd vimenter * ++nested colorscheme gruvbox
" }}}

" vim-airline config {{{
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" only show file name in the tab name (as opposed to the full path)
let g:airline#extensions#tabline#fnamemod = ':t'
" remove 'X' at the end of the tabline
let g:airline#extensions#tabline#show_close_button = 0
" dont show tab numbers on the right
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird orange arrow on the tabline
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (clear it so nothing is shown)
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (clear it so nothing is shown)
" }}}

" }}}
