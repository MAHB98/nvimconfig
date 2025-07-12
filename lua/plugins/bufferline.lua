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
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				show_buffer_close_icons = false,
				separator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
					},
				},
				hover = {
					delay = 200,
					enabled = true,
					reveal = { "close" },
				},
				highlight = colors,
			},
		})
		vim.cmd("highlight! TabLineFill guibg=#1f1d2e guifg=#111111 blend=100")
		vim.cmd("highlight! BufferLineFill guibg=#0d0c13 guifg=#908caa blend=100")
		vim.keymap.set("n", "bc", cmd.unpin_and_close)
	end,
}
