return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					TelescopeBorder = { fg = "highlight_high", bg = "none" },
					TelescopeNormal = { bg = "none" },
					TelescopePromptNormal = { bg = "base" },
					TelescopeResultsNormal = { fg = "subtle", bg = "none" },
					TelescopeSelection = { fg = "text", bg = "base" },
					TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
				},
			})
		end,
	},
	{
		"Alexis12119/nightly.nvim",
		name = "nightly",
		config = function()
			require("nightly").setup({
				transparent = true,
				highlights = {
					CursorLine = { bg = "#000000" },
					FoldColumn = { fg = "#ff0000" },
					Comment = { fg = "#908caa" },
				},
			})
		end,
		-- askjsaj
	},
	{ "catppuccin/nvim", name = "catppuccin" },
}
