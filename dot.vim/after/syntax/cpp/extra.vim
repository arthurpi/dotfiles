" Expect the colorscheme to color these types.

syntax match cFunction /\w\+\s*(/me=e-1,he=e-1
syntax match cTypedef /\w\+_t\s/me=e-0,he=e-0
syntax match cTypedef /\w\+_t;\n/me=e-0,he=e-0
