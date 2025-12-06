return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		-- debounce = 100,
		-- enabled = true,
		-- exclude = { "help", "terminal" },
	},
	-- config = true,
	config = function()
		-- local highlight = {
		-- 	"RainbowRed",
		-- 	"RainbowYellow",
		-- 	"RainbowBlue",
		-- 	"RainbowOrange",
		-- 	"RainbowGreen",
		-- 	"RainbowViolet",
		-- 	"RainbowCyan",
		-- }

		-- local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
		-- end)
		local setup = require("ibl")
		return setup.overwrite({
			debounce = 200,
			enabled = true,
			-- exclude = { "help", "terminal" },
			whitespace = {
				highlight = { "Comment", "Whitespace" },
				remove_blankline_trail = false,
			},
			indent = {
				-- highlight = { "TabLine", "Comment", "Comment" },
				-- highlight = Highlight,

				highlight = { "Comment" },
				-- char = "|",
				smart_indent_cap = false,
			},
			scope = {
				-- char = "|",
				enabled = true,
				show_start = false,
				-- highlight = "TabLineSel",
			},
		})
	end,

	-- config = function()
	-- 	require("ibl").setup({
	--
	-- 		debounce = 100,
	-- 		enabled = true,
	-- 		-- char = "▏",
	-- 		-- buftype_exclude = { "terminal" },
	-- 		-- show_trailing_blankline_indent = false,
	-- 		-- show_current_context = true,
	-- 		exclude = { "help", "terminal" },
	-- 		-- default : {'class', 'function', 'method'}
	-- 		-- context_patterns = {
	-- 		-- 	"class",
	-- 		-- 	"function",
	-- 		-- 	"method",
	-- 		-- 	"^if",
	-- 		-- 	"^while",
	-- 		-- 	"^for",
	-- 		-- 	"^object",
	-- 		-- 	"^table",
	-- 		-- 	"^type",
	-- 		-- 	"^import",
	-- 		-- 	"block",
	-- 		-- 	"arguments",
	-- 		-- },
	-- 		-- disabled now for performance hit.
	-- 		-- use_treesitter = true
	-- 	})
	-- end,
}
