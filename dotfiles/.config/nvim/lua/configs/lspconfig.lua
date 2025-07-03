require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "rust_analyzer", "bashls", "gopls" }
vim.lsp.enable(servers)
