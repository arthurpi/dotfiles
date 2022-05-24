local lualine = require 'lualine'
lualine.setup{
    options = { theme = 'seoul256' },
    tabline = {
        lualine_a = {
            {
                'tabs',
                mode = 2,
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}
