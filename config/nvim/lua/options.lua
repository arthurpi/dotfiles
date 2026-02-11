-- lua/options.lua
local opt = vim.opt

-- General
opt.mouse = 'a'                                         -- Enable mouse support
opt.formatoptions:append('j')                           -- Remove comment char when joining lines
opt.shortmess:append('A')                               -- Disable swap warning
opt.encoding = 'utf-8'                                  -- Character encoding
opt.display = 'uhex'                                    -- Print hex value of non-printable chars
opt.scrolloff = 10                                      -- Keep 10 lines below cursor
opt.autoread = true                                     -- Watch external file changes
opt.number = true                                       -- Display line number
opt.cursorline = true                                   -- Highlight current line
opt.showcmd = true                                      -- Display cmd info
opt.showmode = false                                    -- Hide current mode (handled by statusline)
opt.visualbell = false                                  -- Disable flashing
opt.errorbells = false                                  -- Disable bells
opt.backspace = { 'indent', 'eol', 'start' }            -- Allow backspace everywhere
opt.laststatus = 2                                      -- Always display status bar
opt.foldmethod = 'manual'                               -- Folding method
opt.list = true                                         -- Display invisible chars
opt.listchars = { eol = '¬', tab = '▸ ', trail = '.' }  -- Symbol to display
opt.fillchars = { fold = ' ' }                          -- No trailing chars for folded blocks
opt.colorcolumn = "81"                                  -- Highlight 81st column
opt.signcolumn = "auto:4"

-- Indentation
opt.autoindent = true                                   -- Keep indentation from the line above
opt.smartindent = true                                  -- Extend indentation (C-like)
opt.shiftwidth = 4                                      -- Four spaces indentation
opt.tabstop = 4                                         -- Sizeof tabs
opt.softtabstop = 4                                     -- Sizeof softtabs
opt.expandtab = true                                    -- Replace tab with spaces

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.magic = true
opt.showmatch = true

-- Wildmenu
opt.wildmenu = true
opt.wildmode = { 'list:longest', 'full' }
opt.wildignore:append({ '.git', '.svn', '.hg', '.exe', '.o', '.out', '.so', '.a' })

-- Backup/Swap
opt.viminfo = ""
opt.backup = false
opt.undofile = true
opt.swapfile = true
