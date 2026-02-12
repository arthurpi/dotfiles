-- lua/configs/lsp.lua
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize Mason
require("mason").setup()

-- Configure Mason-LSPConfig
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
        "gopls",
        "rust_analyzer",
        "kotlin_language_server",
    },
})

-- Common handlers
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

vim.lsp.config("clangd", {
    cmd = { "clangd", "--background-index", "--clang-tidy" },
})

vim.lsp.config("rust_analyzer", {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" }, -- Use clippy for linting
        },
    },
})
