return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                              , branch = '0.1.x',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			require("custom.multigrep").setup()
			require("telescope").setup({
				pickers = {
					-- help_tags = {
					-- 	theme = "ivy",
					-- },
				},
				extensions = {
					fzf = {
						fuzzy = true,
						overrie_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "oldfiles" })
			vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>en", function()
				builtin.find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end, { desc = "edit neovim" })
			vim.keymap.set("n", "<leader>ep", function()
				builtin.find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end, { desc = "edit package" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags)
			vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>ps", builtin.live_grep)
			vim.keymap.set("n", "<leader>fw", function()
				builtin.current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") })
			end, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps)
		end,
	},
}
