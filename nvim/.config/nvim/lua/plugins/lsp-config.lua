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
        ensure_installed = { "lua_ls", "clangd", "jdtls" },
      })
    end,
  },
  {
    -- how we are able to setup our LSPs to run in neovim
    "neovim/nvim-lspconfig",
    config = function()
      -- This is the section where we broadcast that we can listen to LSP recommendations, and they should give us recs
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- setup java before the rest of lsp config
      require('java').setup()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        cmd = {
          "jdtls",
          "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar"),
        },
        capabilities = capabilities,
      })

      -- keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
