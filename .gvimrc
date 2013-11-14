" gvim configuration file
" @author : qrthur
" @version : 0

"gvim options
set go-=m			"remove menu
set go-=T			"remove toolbar
set go-=r			"remove right-hand scroll bar
set go-=R			"remove right-hand scroll bar
set go-=l			"remove left-hand scroll bar
set go-=L			"remove left-hand scroll bar
set go-=b			"remove bottom scroll bar

set novisualbell			"disable annoying screen flashes
set vb t_vb=			"disable annoying bell

"fonts
if has("gui_win32")
  set guifont=Consolas:h9:cANSI
endif
