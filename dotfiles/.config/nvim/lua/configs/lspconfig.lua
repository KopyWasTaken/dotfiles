require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "rust_analyzer", "bashls" }
vim.lsp.enable(servers)
