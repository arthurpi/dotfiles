" Highlight all function names
syntax match cCustomFunc /\w\+\s*(/me=e-1,he=e-1
highlight def link cCustomFunc qOSType

syntax match cCustomTypeDef /\w\+_t\s/me=e-0,he=e-0
highlight def link cCustomTypeDef Type

" syntax match cCustomPtr /\w\+\s*[->|.|\[]/me=e-1,he=e-1
" highlight def link cCustomPtr Define
