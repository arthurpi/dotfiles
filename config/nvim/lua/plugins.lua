-- lua/plugins.lua
return {
    -- 1. Gruvbox (Colorscheme)
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000, 
        config = function()
            require("configs.gruvbox") -- Loads lua/configs/gruvbox.lua
        end,
    },

    -- 2. Lualine (Statusline)
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.lualine") -- Loads lua/configs/lualine.lua
        end,
    },

    -- 3. Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("configs.telescope") -- Loads lua/configs/telescope.lua
        end,
    },

    -- 4. Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("configs.neo-tree")
        end,
    },

    -- 5. Lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.lualine")
        end,
    },

    -- 6. Gitsigns
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.gitsigns")
        end,
    },

    -- 7. ToggleTerm
    {
        "akinsho/toggleterm.nvim",
        version = "*", 
        config = function()
            require("configs.toggleterm")
        end,
    },

    -- 8. Comment.nvim
    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment")
        end,
    },

    -- 9. Nvim Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("configs.treesitter")
        end,
    },
}
