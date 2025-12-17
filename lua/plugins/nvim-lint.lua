return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters.eslint = require("lint.util").wrap(lint.linters.eslint, function(diagnostic)
			if diagnostic.code == "@typescript-eslint/no-unused-vars" then
				return nil
			end
			return diagnostic
		end)
		lint.handlers = {
			eslint = function(diagnostics)
				for _, diagnostic in ipairs(diagnostics) do
					-- Match the rule exactly as it appears in ESLint output
					if diagnostic.code == "@typescript-eslint/no-unused-vars" then
						-- Change severity to INFO (or nil to hide)
						diagnostic.severity = vim.diagnostic.severity.INFO
						-- Alternatively, if you want to completely hide the warning:
						-- diagnostic.severity = nil
					end
				end
				return diagnostics
			end,
		}

		-- Define linters for different filetypes
		lint.linters_by_ft = {
			markdown = { "vale" },
			typescriptreact = { "eslint" },
			javascriptreact = { "eslint" }, -- Add more if needed
			typescript = { "eslint" }, -- Add TypeScript
			javascript = { "eslint" }, -- Add JavaScript
		}

		-- Create a command to trigger linting and display results in Quickfix
		vim.api.nvim_create_user_command("LintQF", function()
			lint.try_lint()
			vim.defer_fn(function()
				vim.diagnostic.setqflist({ open = true })
			end, 200) -- delay to allow linting to finish
		end, {})

		-- Set up autocommands to trigger linting on specific events
		-- vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "BufWritePost" }, {
		-- 	callback = function()
		-- 		-- Trigger linting for the current filetype
		-- 		lint.try_lint()
		--
		-- 		-- Optionally, run specific linters (e.g., only "eslint")
		-- 		-- lint.try_lint("eslint")
		-- 	end,
		-- })
	end,
}
