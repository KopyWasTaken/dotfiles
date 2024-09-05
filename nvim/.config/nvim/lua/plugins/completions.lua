return {
	{
		-- This allows nvim-cmp to reach out to LSPs for snippet and autocompletion recommendations
		-- see lsp-config for the section that broadcasts the capability for nvim-cmp to listen to an LSP recommendation
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip", -- Snippet engine written in lua
		dependencies = {
			"saadparwaiz1/cmp_luasnip", -- completions for luasnip engine
			"rafamadriz/friendly-snippets", -- for VCCode like snippet suggestions
		},
	},
	{
		-- completions in neovim
		"hrsh7th/nvim-cmp",
		config = function()
			-- Set up nvim-cmp.
			local cmp = require("cmp")

			-- Setup luasnip to use the friendly snippets setup
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- default LSP servers
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "codium" }, -- for codium AI stuff
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
