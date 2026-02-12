return {
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("configs.gruvbox") -- Loads lua/configs/gruvbox.lua
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.lualine") -- Loads lua/configs/lualine.lua
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("configs.telescope") -- Loads lua/configs/telescope.lua
        end,
    },

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

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("configs.lualine")
        end,
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.gitsigns")
        end,
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("configs.toggleterm")
        end,
    },

    {
        "numToStr/Comment.nvim",
        config = function()
            require("configs.comment")
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            {
                "mason-org/mason.nvim", opts = {}
            },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("configs.lsp")
        end,
    },
}
