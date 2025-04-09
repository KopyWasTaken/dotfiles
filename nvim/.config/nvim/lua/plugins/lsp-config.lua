return {
  {
    -- package manager for installing LSPs, DAPs, Formatters, etc
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- bridges the gap between mason and the lsp, adds some configuration setups
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "ruff", "ruff_lsp" },
      })
    end,
  },
  {
    -- how we are able to setup our LSPs to run in neovim
    "neovim/nvim-lspconfig",
    config = function()
      -- This is the section where we broadcast that we can listen to LSP recommendations, and they should give us recs
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
      })

      -- keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover text (for functions usually)" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition within buffer" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration within buffer" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implmentation within buffer" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })

      -- switch between source and header for c / c++ files
      vim.keymap.set("n", "<leader>h", "<cmd>:ClangdSwitchSourceHeader<CR>", {
        desc = "Switch from the header to source file (C/C++) and vice versa",
      })
    end,
  },
}
