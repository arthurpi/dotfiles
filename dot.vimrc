" vim configuration file

set nocompatible
filetype off

" google {{{
if filereadable("/usr/share/vim/google/google.vim")
  source /usr/share/vim/google/google.vim
endif
" }}}

" plugins {{{
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
Plugin 'gmarik/vundle'

"plugins
Plugin 'airblade/vim-gitgutter'         " show local git diff (+-)
Plugin 'vim-scripts/git-file.vim'       " :e git-branch:file-name
Plugin 'tpope/vim-commentary'           " comment stuff
Plugin 'tpope/vim-fugitive'             " show git branch in status bar
Plugin 'tpope/vim-surround'             " surroundings ([]()''...) util
Plugin 'ggandor/lightspeed.nvim'        " move quickly

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'neoclide/coc.nvim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'

Plugin 'morhetz/gruvbox'

Plugin 'nvim-lua/plenary.nvim'
Plugin 'MunifTanjim/nui.nvim'
Plugin 'nvim-neo-tree/neo-tree.nvim'

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

" toggle line numbers
nnoremap <Leader>n      :set number!<CR>
" clear search results
nnoremap <Leader>s      :let @/ = ""<CR>

" select all
nnoremap <Leader>a      ggVG

" search selected text block (visual mode)
vnoremap <Leader>sb     y/<C-r>"<CR>

" run make
" TODO: write a function that call the right tool depending on the project
nnoremap <Leader>d      :!fx build<CR>

" delete trailing spaces/tabs
nnoremap <Leader>x      :%s/\s\+$//e<CR>

" save current file with root privileges
cnoremap w!! w !sudo tee % >/dev/null

" }}}

" remap existing bindings {{{
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

" vim-go {{{
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 0
" }}}

" vim.surround config {{{
" add * around word under cursor
nmap <Leader>b          ysiw*
" add * around selection
vmap <Leader>b          S*
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

" coc config {{{

" per language config instructions -
"   for rust, :CocInstall coc-rust-analyzer
"   for c/cpp, config in coc-settings.json (install ccls)
"   for gocode, run :GoInstallBinaries (vim-go) and config in coc-settings.json.
"   for g3, see coc-settings.json.cider

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gf :call CocActionAsync('highlight')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline^=%{FugitiveStatusline()}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" }}}
" }}}
