return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"saifulapm/neotree-file-nesting-config",
	},
	lazy = false,
	config = function()
		local cmd = require("neo-tree")

		cmd.setup({

			-- enable_cursor_hijack = true,

			enable_git_status = true,
			hide_root_node = true,
			retain_hidden_root_indent = true,
			default_component_configs = {
				git_status = {
					indent = {
						-- expander_highlight = "NeoTreeExpander",
						with_expanders = true,
						expander_collapsed = "",
						expander_expanded = "",
					},
					symbols = {
						-- Change type
						added = "✚",
						deleted = "✖",
						modified = "",
						renamed = "󰁕",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			filesystem = {
				filtered_items = {
					show_hidden_count = false,
					never_show = {
						".DS_Store",
					},
				},
			},
			nesting_rules = require("neotree-file-nesting-config").nesting_rules,
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},

				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.opt.guicursor = "n:Cursor/lCursor"
						vim.cmd("highlight! Cursor blend=100") -- optional
						vim.cmd("highlight! CursorLine guibg=#00ff00 blend=0") -- optional
					end,
				},
				{
					event = "neo_tree_buffer_leave",
					handler = function()
						vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
						vim.cmd("highlight! CursorLine guibg=#111111 blend=100") -- optional
					end,
				},
			},
		})
		vim.keymap.set("n", "<leader>b", function()
			require("neo-tree.command").execute({
				toggle = true,
				-- source = "" ,
				position = "left",
				reveal = true,
			})
		end)
	end,
}
