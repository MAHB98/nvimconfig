return {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			typescriptreact = { "eslint" },
		}
		vim.api.nvim_create_user_command("LintQF", function()
			vim.keymap.set("n", "<C-j>", ":cp <cr>")
			require("lint").try_lint()
			vim.defer_fn(function()
				vim.diagnostic.setqflist({ open = true })
			end, 200) -- delay to allow linting to finish
		end, {})

		-- vim.keymap.set("n", "<leader>l", require("lint").try_lint())
	end,
}
