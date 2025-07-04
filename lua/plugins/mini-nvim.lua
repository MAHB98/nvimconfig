return
-- plugins.lua or inside lazy.setup({...})
{
	"echasnovski/mini.nvim",
	version = false, -- or tag = '*' to pin
	config = function()
		require("mini.surround").setup()
		require("mini.pairs").setup({})
		require("mini.move").setup({
			mappings = {
				left = "<M-left>",
				down = "<M-Down>",
				up = "<M-Up>",
				right = "<M-right>",
				line_left = "<M-left>",
				line_down = "<M-Down>",
				line_up = "<M-Up>",
				line_right = "<M-right>",
			},
		})
		require("mini.comment").setup({
			mappings = {
				-- Toggle comment (like `gcip` - comment inner paragraph) for both
				-- Normal and Visual modes
				comment = "<leader>/",
				-- Toggle comment on current line
				comment_line = "<leader>/",
				-- Toggle comment on visual selection
				comment_visual = "<leader>/",
				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				--
				-- Works also in Visual mode if mapping differs from `comment_visual`
				textobject = "<leader>/",
			},
		})
		-- require('mini.completion').setup()
		-- You can configure other modules as needed
	end,
}
