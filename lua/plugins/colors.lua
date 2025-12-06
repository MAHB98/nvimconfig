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
					IblScope = { fg = "#ffffff" },
					FoldColumn = { fg = "#ff0000" },
					Comment = { fg = "#908caa" },
					TabLineSel = { bg = "#ff0000" },
					TabLineFill = { fg = "#1f1d2e", bg = "#111111" },
					BufferLineFill = { fg = "#908caa", bg = "#0d0c13" },
					["@variable"] = { fg = "#ffffff", style = "italic" },
					DiagnosticUnnecessary = { fg = "#908caa" },
					nonText = { fg = "#908caa" },
				},
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		config = function()
			require("tokyonight").setup({
				transparent = true,
				highlights = {
					CursorLine = { bg = "#000000" },
					FoldColumn = { fg = "#ff0000" },
					Comment = { fg = "#908caa" },
					TabLineSel = { bg = "#ff0000" },
					TabLineFill = { fg = "#1f1d2e", bg = "#111111" },
					BufferLineFill = { fg = "#908caa", bg = "#0d0c13" },
					-- TelescopeMatching = { fg = " #8CCF7E" },
					-- TelescopeSelection = { fg = " #8CCF7E", bg = "#141B1E" },
					-- TelescopeMultiSelection = { bg = "#0F1416" },
					-- TelescopePromptTitle = { fg = "#141B1E", bg = "#DADADA" },
					-- TelescopePreviewLine = { bg = "#141B1E" },
					-- TelescopePromptPrefix = { fg = "#8ccf7e", bg = "#242e32" },
					-- TelescopePromptBorder = { fg = "#242e32", bg = "#242e32" },
					-- TelescopePromptNormal = { fg = "#DADADA", bg = "#242e32" },
					-- TelescopeResultsTitle = { fg = "#0F1416", bg = "#0F1416" },
					-- TelescopeResultsBorder = { fg = "#0F1416", bg = "#0F1416" },
					-- TelescopeResultsNormal = { fg = "#DADADA", bg = "#0F1416" },
					-- TelescopePreviewTitle = { fg = "#141B1E", bg = "#DADADA" },
					-- TelescopePreviewBorder = { fg = "#0F1416", bg = "#0F1416" },
					-- TelescopePreviewNormal = { fg = "#DADADA", bg = "#0F1416" },
				},
			})
		end,
	},
}
