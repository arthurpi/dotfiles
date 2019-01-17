" vim configuration file
" @author : qrthur
" @version : 0.1

set nocompatible
filetype off

"init Vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'

"plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/git-file.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wting/rust.vim'
Plugin 'ronakg/quickr-cscope.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()

"colors
colorscheme jellybeans

"general options
filetype plugin indent on
syntax on

set formatoptions+=j                    "remove comment char when J
set shortmess+=A                        "disable swap warning
set encoding=utf-8                      "character encoding.
set t_Co=256                            "enable 256bits color
set list                                "display invisible char
set listchars=eol:¬,tab:▸\ ,trail:.     "symbol to display
hi SpecialKey ctermbg=234 guifg=#649A9A "invisible char color

set display=uhex                        "print hex value of non-printable chars
set scrolloff=8                         "leave at least 10 lines below current
set autoread                            "watch external file changes
set number                              "display line number
set cursorline                          "highlight current line
set showcmd                             "display cmd info
set noshowmode                          "hide current mode
set novisualbell                        "disable annoying screen flashes
set vb t_vb=                            "disable annoying bell
set backspace=indent,eol,start          "allow backspace everywhere
set laststatus=2                        "always display bottom status bar
set fdm=manual                          "folding method

let &colorcolumn="80"
highlight ColorColumn ctermbg=234 guibg=#2c2d27

"ctags
set tags=./.tags;/

"indentations & tabs
set autoindent                          "keep indentation from the line above
set smartindent                         "extend indentation (C-like)
set shiftwidth=4                        "4 spaces indentation
set tabstop=4                           "sizeof tabs
set softtabstop=4                       "sizeof softtabs
set expandtab                           "replace tab with spaces
autocmd VimResized * execute "normal \<c-w>="

"search
set hlsearch                            "highligh search result
set incsearch                           "browser-like searches
set ignorecase                          "case insensitive
set smartcase                           "(unless there's uppercase char in search)
set magic                               "for regexp
set showmatch                           "highlight braces

"auto completion menu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn,.hg
set wildignore+=.exe,.o,.out,.so,.a

"shortcuts
let mapleader = ","
"toggle cursor line
nnoremap <Leader>l      :set cursorline!<CR>
"toggle line numbers
nnoremap <Leader>n      :set number!<CR>
"clear search results
nnoremap <Leader>s      :let @/ = ""<CR>
"select all
nnoremap <Leader>a      ggVG
"run make
nnoremap <Leader>d      :!make<CR>
"delete trailing spaces/tabs
nnoremap <Leader>x      :%s/\s\+$//e<CR>
"open tagbar, jump to the tagbar split, and resize other splits to be of same size
nnoremap <Leader>t      :TagbarOpen fj<CR><C-w>=
"refresh ctags file
nnoremap <Leader>r      :!ctags<CR><CR>
nnoremap <silent> +     :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> -     :exe "resize " . (winwidth(0) * 2/3)<CR>
"insert new line at cursor position
nnoremap <Leader><CR>   i<CR><ESC>
"open ctrlp (file finder)
nnoremap <Leader>Ctrl-p :CtrlPTag<CR>
"ycm fixit
nnoremap <Leader>f      :YcmCompleter FixIt<CR>
"comment selected block
map <Leader>c           <C-_><C-_>
"toggle tagbar and resize other splits to be of same size
nnoremap <F8>           :TagbarToggle<CR>
"save current file with root privileges
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
"exit insert mode with jj or kk strokes
inoremap jj             <Esc>
inoremap kk             <Esc>

" Plugin
let g:EasyMotion_leader_key = ","

let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 1
let g:ycm_auto_trigger = 1

let g:tagbar_autoclose = 0

let g:ctrlp_custom_ignore = { 'file': '\v\.(exe|so|dll|d|o|out)$' }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

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

"cscope stuff
if has('cscope')
    " set cscopetag
    set cscopeverbose csto=0
    cnoreabbrev csh cs help

    let g:quickr_cscope_keymaps = 0
    let g:quickr_cscope_db_file = ".cscope.out"

    " 's' symbol: find all references to the token under cursor
    " 'g' global: find global definition(s) of the token under cursor
    " 'c' calls:  find all calls to the function name under cursor
    " 't' text:   find all instances of the text under cursor
    " 'e' egrep:  egrep search for the word under cursor
    " 'f' file:   open the filename under cursor
    " 'i' includes: find files that include the filename under cursor
    " 'd' called: find functions called by function under cursor
    nmap <Leader>S <plug>(quickr_cscope_symbols)<Leader>s
    nmap <Leader>G <plug>(quickr_cscope_global)<Leader>s
    nmap <Leader>C <plug>(quickr_cscope_callers)<Leader>s
    nmap <Leader>F <plug>(quickr_cscope_files)<Leader>s
    nmap <Leader>I <plug>(quickr_cscope_includes)<Leader>s
    nmap <Leader>T <plug>(quickr_cscope_text)<Leader>s
    nmap <Leader>E <plug>(quickr_cscope_egrep)
    nmap <Leader>D <plug>(quickr_cscope_functions)<Leader>s

    nmap <Leader>Z :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' -not -path 'pic24/*' > .cscope.files<CR>
           \:!cscope -b -i .cscope.files -f .cscope.out<CR>
           \:cs reset<CR>

endif
