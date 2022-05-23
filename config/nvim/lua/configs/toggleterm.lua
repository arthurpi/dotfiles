require 'toggleterm'.setup{
    size = 10,
    open_mapping = [[<c-\>]],
    shading_factor = 2,
    direction = 'float',
    float_opts = {
        border = 'curved',
        highlights = {
            border = 'Normal',
            background = 'Normal',
        },
    },
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = 'lazygit',
    direction = 'float',
    hidden = false,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>lua _lazygit_toggle()<CR>',
                        {
                            noremap = true,
                            silent = true,
                        })
