" vim configuration file
" @author : qrthur
" @version : 0.1

set nocompatible
filetype off

"init Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"plugins
Bundle 'bling/vim-airline'
Bundle 'Lokaltog/vim-easymotion'

"colors
colorscheme jellybeans

"general options
filetype plugin indent on
syntax on
set encoding=utf-8			"character encoding.
set t_Co=256				"enable 256bits color
set list				"display invisible char
set listchars=eol:¬,tab:▸\ ,trail:.	"symbol to display
set number				"display line number
set cursorline				"highlight current line
set showcmd				"display cmd info
set novisualbell			"disable annoying screen flashes
set vb t_vb=				"disable annoying bell
set backspace=indent,eol,start		"allow backspace everywhere
set laststatus=2			"always display bottom status bar

"indentation
set autoindent				"keep indentation from the line above
set smartindent				"extend indentation when needed
set shiftwidth=2			"2 spaces indentation

"search
set hlsearch				"highligh search result
set incsearch				"browser-like searches
set magic				"for regexp
set showmatch				"highlight braces

"auto completion menu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn,.hg
set wildignore+=.exe,.o,.out,.so,.a

"shortcuts
let mapleader = " "
nnoremap <Leader>l	:set cursorline!<CR>
nnoremap <Leader>n	:set number!<CR>
nnoremap <C-p>		:Vexplore<CR>
nnoremap <Leader><CR>	i<CR><ESC>
nnoremap <C-k>		{
nnoremap <C-j>		}
vnoremap <C-k>		{
vnoremap <C-j>		}
nnoremap H		:tabprev<CR>
nnoremap L		:tabnext<CR>
vnoremap H		:tabprev<CR>
vnoremap L		:tabnext<CR>
vnoremap <		<gv
vnoremap >		>gv

"disable arrowkey
nnoremap <Up>		<NOP>
inoremap <Up>		<NOP>
vnoremap <Up>		<NOP>
nnoremap <Down>		<NOP>
inoremap <Down>		<NOP>
vnoremap <Down>		<NOP>
nnoremap <Left>		<NOP>
inoremap <Left>		<NOP>
vnoremap <Left>		<NOP>
nnoremap <Right>	<NOP>
inoremap <Right>	<NOP>
vnoremap <Right>	<NOP>

let g:netrw_liststyle=3

"history & backup directories
set viminfo=""				"disable viminfo file
set backup
set undofile
set swapfile

if has("win32")
  set undodir=~\vimfiles\tmp\undo	"merge all backup directory to vimfiles
  set backupdir=~\vimfiles\tmp\backup	" ^
  set directory=~\vimfiles\tmp\swap	" ^
elseif has("unix")
  set undodir=~/.vim/tmp/undo		"merge all backup directory to vimfiles
  set backupdir=~/.vim/tmp/backup	" ^
  set directory=~/.vim/tmp/swap		" ^
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
