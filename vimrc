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
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-dispatch'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'scrooloose/syntastic'

call vundle#end()

"colors
colorscheme jellybeans

"general options
filetype plugin indent on
syntax on

set encoding=utf-8                      "character encoding.
set t_Co=256                            "enable 256bits color
set list                                "display invisible char
set listchars=eol:¬,tab:▸\ ,trail:.     "symbol to display
hi SpecialKey ctermbg=233 guifg=#649A9A "invisible char color

set number                              "display line number
set cursorline                          "highlight current line
set showcmd                             "display cmd info
set noshowmode                          "hide current mode
set novisualbell                        "disable annoying screen flashes
set vb t_vb=                            "disable annoying bell
set backspace=indent,eol,start          "allow backspace everywhere
set laststatus=2                        "always display bottom status bar

let &colorcolumn=join(range(81,999), ",") "color 80th column
let &colorcolumn="80,".join(range(120,999),",") "color 120+ columns
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

" Plugin
let g:EasyMotion_leader_key = ","

let g:syntastic_c_check_header = 1
"let b:syntastic_c_cflags = '-I/home/qrthur/documents/kernel_dev/linux/include'
let g:syntastic_c_include_dirs = ['/home/qrthur/documents/kernel_dev/linux/include']

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

" OmniSharp conf
let g:OmniSharp_host = "http://localhost:2000"

let g:OmniSharp_timeout = 1

set noshowmatch

set completeopt=longest,menuone,preview

set splitbelow

let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

augroup omnisharp_commands
    autocmd!

    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    autocmd FileType cs nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>

    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>

    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>
augroup END

set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer
" than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename
" newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp
" server for the current solution

nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces


nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type
"definition)
set hidden
