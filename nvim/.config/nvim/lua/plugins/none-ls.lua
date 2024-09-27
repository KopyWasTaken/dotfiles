return {
  {
    -- none-ls replaces the old deprecated null-ls, which wraps CLI tools in an LSP api, which is dope
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,  -- formatter for lua
          null_ls.builtins.formatting.clang_format, -- formatter for C / C++
          null_ls.builtins.formatting.prettier, -- formatter for javascript things etc.
          null_ls.builtins.formatting.phpcsfixer, -- formatter for php
          null_ls.builtins.formatting.prettier, -- formatter for web dev
          null_ls.builtins.formatting.black, -- formatter for python 
        },
      })

      -- Keymaps, with explanations
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {}) -- Use this keybind to format the file you're working with. Formatters can be installed through Mason
    end,
  },
}
