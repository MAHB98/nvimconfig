return {
	{
		"rhysd/conflict-marker.vim",
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", function()
				for winnr = 1, vim.fn.winnr("$") do
					local fugitive_status = vim.fn.getwinvar(winnr, "fugitive_status")
					if fugitive_status ~= vim.NIL and fugitive_status ~= "" then
						vim.cmd(winnr .. "wincmd c")
						return
					end
				end
				vim.cmd("keepalt Git")
			end)
			vim.keymap.set("n", "<leader>ga", vim.cmd.Gwrite)
			vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit! <cr>")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"isakbm/gitgraph.nvim",
		opts = {
			git_cmd = "git",
			symbols = {
				merge_commit = "M",
				commit = "*",
			},
			format = {
				timestamp = "%H:%M:%S %d-%m-%Y",
				fields = { "hash", "timestamp", "author", "branch_name", "tag" },
			},
			hooks = {
				on_select_commit = function(commit)
					print("selected commit:", commit.hash)
				end,
				on_select_range_commit = function(from, to)
					print("selected range:", from.hash, to.hash)
				end,
			},
		},
		keys = {
			{
				"<leader>gl",
				function()
					require("gitgraph").draw({ pretty = true }, { all = true, max_count = 5000 })
				end,
				desc = "GitGraph - Draw",
			},
		},
	},
}
