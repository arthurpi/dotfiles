" vim configuration file
" @author : qrthur
" @version : 0.1

set nocompatible
filetype off

"colors
colorscheme jellybeans

"general options
filetype plugin indent on
syntax on
set encoding=utf-8			"character encoding.
set list				"display invisible char
set listchars=eol:¬,tab:▸\ ,trail:.	"symbol to display
set number				"display line number
set showcmd				"display info
set showmatch				"highlight braces
set novisualbell			"disable annoying screen flashes
set vb t_vb=				"disable annoying bell
set backspace=indent,eol,start		"allow backspace everywhere

"indentation
set autoindent				"keep indentation from the line above
set smartindent				"extend indentation when needed
set shiftwidth=2			"2 spaces indentation

"auto completion menu
set wildmenu
set wildmode=list:longest,full
set wildignore+=.git,.svn,.hg
set wildignore+=.exe,.o,.out,.so,.a

"shortcuts
nnoremap <C-k>	{
nnoremap <C-j>	}
vnoremap <C-k>	{
vnoremap <C-j>	}
nnoremap H	:tabprev<CR>
nnoremap L	:tabnext<CR>
vnoremap <	<gv
vnoremap >	>gv

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
