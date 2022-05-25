local whichkey = require 'which-key'

whichkey.setup{
    plugins = {
        spelling = { enabled = true },
        presets = { operators = false },
    },
    window = {
        border = "rounded",
        padding = { 2, 2, 2, 2 },
    },
}
