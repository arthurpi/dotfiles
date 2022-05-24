local lualine = require 'lualine'
lualine.setup{
    options = { theme = 'seoul256' },
    sections = {
        lualine_b = {
            'branch',
            {
                'diff',
                colored = false,
            },
            'diagnostics',
        },
        lualine_c = {
            {
                'filename',
                path = 1,
            },
        },
    },
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
