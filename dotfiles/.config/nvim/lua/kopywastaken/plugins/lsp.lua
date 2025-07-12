return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",           -- Mason helps install LSPs from menu
        "mason-org/mason-lspconfig.nvim", -- Helps Mason communicate with lspconfig
        "hrsh7th/nvim-cmp",               -- Completion engine. Sources are installed separately
        "hrsh7th/cmp-nvim-lsp",           -- nvim-cmp source for LSPs
        "hrsh7th/cmp-buffer",             -- nvim-cmp source for buffer words
        "hrsh7th/cmp-path",               -- nvim-cmp source for paths
        "hrsh7th/cmp-cmdline",            -- nvim-cmp source for command line
        "L3MON4D3/LuaSnip",               -- Snippet engine for Neovim written in Lua
        "saadparwaiz1/cmp_luasnip",       -- completion source for luasnip
        "j-hui/fidget.nvim",              -- Notification window for LSPs and Neovim stuff
    },
    config = function()
        local cmp = require("cmp")              -- completion engine
        local cmp_lsp = require("cmp_nvim_lsp") -- lsp source for completion engine
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({}) -- setup fidget
        require("mason").setup({})  -- setup mason
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "ts_ls" },
            handlers = {
                function(server_name) -- default server handler
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,
            }
        }) -- setup mason-lspconfig

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body) -- for luasnip users
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- for luasnip users
            }, {
                { name = "buffer" },
            })
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
