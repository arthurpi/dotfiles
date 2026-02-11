-- lua/keymaps.lua
local map = vim.keymap.set

-- Edit/Source config
map('n', '<leader>ev', ':tabe $MYVIMRC<cr>')
map('n', '<leader>sv', ':source $MYVIMRC<cr>')

-- Clear search results
map('n', '<leader>s', ':let @/ = ""<CR>')

-- Select all
map('n', '<leader>a', 'ggVG')

-- Search selected text block (visual mode)
map('v', '<leader>sb', 'y/<C-r>"<CR>')

-- Delete trailing spaces
map('n', '<leader>x', ':%s/\\s\\+$//e<CR>')

-- Save with sudo
map('c', 'w!!', 'w !sudo tee % >/dev/null')

-- Remaps
map({'n', 'v'}, '<C-k>', '{')
map({'n', 'v'}, '<C-j>', '}')

-- Tab navigation
map({'n', 'v'}, 'H', ':tabprev<CR>')
map({'n', 'v'}, 'L', ':tabnext<CR>')

-- Indentation handling in visual mode (keeps selection)
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Map ; to :
map({'n', 'v'}, ';', ':')

-- Exit insert mode with jj
map('i', 'jj', '<Esc>')
