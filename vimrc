" vim configuration file
" @author : qrthur
" @version : 0.1

set nocompatible
filetype off

"init Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

"plugins
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
Plugin 'wting/rust.vim'

call vundle#end()

"colors
colorscheme jellybeans

"general options
filetype plugin indent on
syntax on

set encoding=utf-8                      "character encoding.
set t_Co=256                            "enable 256bits color
set list                                "display invisible char
set listchars=eol:¬,tab:→\ ,trail:.     "symbol to display
hi SpecialKey ctermbg=233 guifg=#649A9A "invisible char color

set number                              "display line number
set cursorline                          "highlight current line
set showcmd                             "display cmd info
set noshowmode                          "hide current mode
set novisualbell                        "disable annoying screen flashes
set vb t_vb=                            "disable annoying bell
set backspace=indent,eol,start          "allow backspace everywhere
set laststatus=2                        "always display bottom status bar
set fdm=indent                          "folding method

let &colorcolumn="80"
highlight ColorColumn ctermbg=234 guibg=#2c2d27


"indentations & tabs
set autoindent                          "keep indentation from the line above
set smartindent                         "extend indentation (C-like)
set shiftwidth=4                        "2 spaces indentation
set tabstop=4                           "sizeof tabs
set softtabstop=4                       "sizeof softtabs
set expandtab                           "replace tab with spaces
autocmd VimResized * execute "normal \<c-w>="

"search
set hlsearch                            "highligh search result
set incsearch                           "browser-like searches
set magic                               "for regexp
set showmatch                           "highlight braces

"auto completion menu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn,.hg
set wildignore+=.exe,.o,.out,.so,.a

"shortcuts
let mapleader = ","
nnoremap <Leader>l      :set cursorline!<CR>
nnoremap <Leader>n      :set number!<CR>
nnoremap <Leader>s      :let @/ = ""<CR>
nnoremap <Leader>a      ggVG
nnoremap <silent> + :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winwidth(0) * 2/3)<CR>
nnoremap <Leader><CR>   i<CR><ESC>
nnoremap <Leader>Ctrl-p :CtrlPTag<CR>
map <Leader>c           <C-_><C-_>
nnoremap <F8>           :TagbarToggle<CR>
cnoremap w!! w !sudo tee % >/dev/null
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
inoremap jj             <Esc>
inoremap kk             <Esc>

" Plugin
let g:EasyMotion_leader_key = ","

"disable arrowkey
nnoremap <Up>       <NOP>
inoremap <Up>       <NOP>
vnoremap <Up>       <NOP>
nnoremap <Down>     <NOP>
inoremap <Down>     <NOP>
vnoremap <Down>     <NOP>
nnoremap <Left>     <NOP>
inoremap <Left>     <NOP>
vnoremap <Left>     <NOP>
nnoremap <Right>    <NOP>
inoremap <Right>    <NOP>
vnoremap <Right>    <NOP>


"history & backup directories
set viminfo=""      "disable viminfo file
set backup
set undofile
set swapfile

if has("win32")
    set undodir=~\vimfiles\tmp\undo       "merge all backup directory to vimfiles (win)
    set backupdir=~\vimfiles\tmp\backup   " ^
    set directory=~\vimfiles\tmp\swap     " ^
elseif has("unix")
    set undodir=~/.vim/tmp/undo           "merge all backup directory to .vim (unix)
    set backupdir=~/.vim/tmp/backup       " ^
    set directory=~/.vim/tmp/swap         " ^
endif
if (!isdirectory(expand(&undodir)))
    call mkdir(expand(&undodir), "p")
endif
if (!isdirectory(expand(&backupdir)))
    call mkdir(expand(&backupdir), "p")
endif
if (!isdirectory(expand(&directory)))
    call mkdir(expand(&directory), "p")
endif
