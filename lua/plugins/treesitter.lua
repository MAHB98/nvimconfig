return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	lazy = false,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"typescript",
				"html",
			},
			sync_install = true,
			auto_install = true,
			ignore_install = {},
			modules = {},
			-- autotag = { enable = true },
			highlight = { enable = true },
		})
	end,
}
