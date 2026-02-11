-- Setup the theme
require("gruvbox").setup({
    contrast = "hard", -- can be "hard", "soft" or ""
    overrides = {
        -- Your custom color overrides
        SpecialKey = { fg = "#649A9A", bg = "NONE" },
        ColorColumn = { bg = "#2c2d27" },
        Folded = { bg = "#262626" },
    }
})

-- Load the colorscheme
vim.cmd("colorscheme gruvbox")
