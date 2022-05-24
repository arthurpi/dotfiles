local lualine = require 'lualine'
lualine.setup{
    options = { theme = 'gruvbox' },
    sections = {
        lualine_b = {
            'branch',
            {
                'diff',
                colored = false,
                symbols = {
                    added = ' ',
                    modified = ' 柳',
                    removed = '  ',
                },
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
                max_length = vim.o.columns,
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
