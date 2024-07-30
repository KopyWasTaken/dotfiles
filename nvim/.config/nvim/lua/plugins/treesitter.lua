return {
	{
		-- highlighting and indenting and what not, makes things easier
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				auto_install = true, -- automatically install language support for files it encounters
				highlight = { enabled = true },
				indent = { enabled = true },
			})
		end,
	},
}
