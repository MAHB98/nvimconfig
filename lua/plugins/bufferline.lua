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
				mode = "Tab",
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				show_buffer_close_icons = false,
				indicator = { style = "underline" },
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
		vim.keymap.set("n", "bc", cmd.unpin_and_close)
		vim.keymap.set("n", "<leader>pb", cmd.pick)
		vim.keymap.set({ "n", "v" }, "]b", ":BufferLineCycleNext <cr>", { silent = true })
		vim.keymap.set({ "n", "v" }, "[b", ":BufferLineCyclePrev <cr>", { silent = true })
		vim.keymap.set("n", "<leader>l", ":BufferLineCloseLeft <cr>")
	end,
}
