-- lua/autocmds.lua
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Vim filetype settings
local grp_vim = augroup("filetype_vim", { clear = true })
autocmd("FileType", {
    pattern = "vim",
    command = "setlocal foldmethod=marker",
    group = grp_vim,
})

-- Apply notes filetype
autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.notes",
    command = "set filetype=notes",
})

-- Resize windows automatically
autocmd("VimResized", {
    pattern = "*",
    command = "execute 'normal \\<c-w>='",
})
