return {
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
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
	},
}
