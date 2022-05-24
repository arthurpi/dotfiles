require 'neo-tree'.setup{
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = false,
    default_component_configs = {
        container = {
            enable_character_fade = false,
        },
        indent = {
            padding = 0,
            with_expanders = false,
        },
        icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "",
        },
        git_status = {
            symbols = {
                added = "",
                deleted = "",
                modified = "",
                renamed = "➜",
                untracked = "★",
                ignored = "◌",
                unstaged = "✗",
                staged = "✓",
                conflict = "",
            },
        },
    },
    window = {
        width = 25,
        mappings = {
            ["o"] = "open",
        },
    },
}

vim.api.nvim_set_keymap('n', '<leader>nt', '<cmd>:NeoTreeShowToggle<CR>', {
    noremap = true,
    silent = true,
})
