return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "ColorScheme",
	config = function()
		local colors = require("rose-pine.plugins.bufferline")
		local cmd = require("bufferline")

		cmd.setup({
			options = {
				mode = "buffers",
				diagnostics = "nvim_lsp",
				-- themable = true,
				show_buffer_close_icons = false,
				-- indicator = {
				-- 	style = "underline",
				-- },
				separator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true, -- use a "true" to enable the default, or set your own character
					},
				},
				hover = {
					delay = 200,
					enabled = true,
					reveal = { "close" },
				},
				highlight = colors,
				-- highlights = {
				-- 	fill = {
				-- 		fg = "#ff0000",
				-- 		bg = "#0000ff",
				-- 	},
				-- 	-- 	background = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	tab = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	tab_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	tab_separator = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	tab_separator_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		underline = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	tab_close = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	close_button = {
				-- 		fg = "#ff0000",
				-- 		bg = "#0000ff",
				-- 	},
				-- 	-- 	close_button_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	close_button_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	buffer_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	buffer_selected = {
				-- 		fg = "#ff0000",
				-- 		bg = "#0000ff",
				-- 		bold = true,
				-- 		italic = true,
				-- 	},
				-- 	-- 	numbers = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	numbers_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	numbers_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	diagnostic = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	diagnostic_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	diagnostic_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	hint = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	hint_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	hint_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	hint_diagnostic = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	hint_diagnostic_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	hint_diagnostic_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	info = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	info_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	info_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	info_diagnostic = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	info_diagnostic_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	info_diagnostic_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	warning = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	warning_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	warning_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	warning_diagnostic = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	warning_diagnostic_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	warning_diagnostic_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	error = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	error_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	error_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	error_diagnostic = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	error_diagnostic_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	error_diagnostic_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		sp = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	modified = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	modified_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	modified_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	duplicate_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	duplicate_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	duplicate = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	separator_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	separator_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	separator = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	indicator_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	indicator_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	pick_selected = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	pick_visible = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	pick = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 		bold = true,
				-- 	-- 		italic = true,
				-- 	-- 	},
				-- 	-- 	offset_separator = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- 	-- 	trunc_marker = {
				-- 	-- 		fg = "<colour-value-here>",
				-- 	-- 		bg = "<colour-value-here>",
				-- 	-- 	},
				-- },
			},
		})
		vim.cmd("highlight! TabLineFill guibg=#1f1d2e guifg=#111111 blend=100")
		vim.cmd("highlight! BufferLineFill guibg=#0d0c13 guifg=#908caa blend=100")
		vim.keymap.set("n", "bc", cmd.unpin_and_close)

		-- vim.keymap.set("n", "<c-K>", cmd.get_current_element_index)
	end,
}
