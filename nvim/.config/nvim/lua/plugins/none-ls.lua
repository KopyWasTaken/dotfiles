return {
  {
    -- none-ls replaces the old deprecated null-ls, which wraps CLI tools in an LSP api, which is dope
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local sources = {
        null_ls.builtins.formatting.stylua,   -- formatter for lua
        null_ls.builtins.formatting.clang_format, -- formatter for C / C++
        null_ls.builtins.formatting.prettier, -- formatter for javascript things etc.
        null_ls.builtins.formatting.phpcsfixer, -- formatter for php
        null_ls.builtins.formatting.prettier, -- formatter for web dev
        null_ls.builtins.formatting.ruff,     -- formatter for pyton
      }

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
        end,
        sources = sources,
      })

      -- Keymaps, with explanations
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format the buffer" }) -- Use this keybind to format the file you're working with. Formatters can be installed through Mason
    end,
  },
}
