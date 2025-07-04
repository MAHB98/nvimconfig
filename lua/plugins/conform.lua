return {
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0",
		keys = {
			{ "<leader>n", "<cmd>ASToggle<CR>", desc = "Toggle auto-save" },
		},
		cmd = "ASToggle",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			debounce_delay = 2000,
			cancel_deferred_save = {
				"InsertEnter",
				{ "User", pattern = "VisualEnter" },
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local function first(bufnr, ...)
				local conform = require("conform")
				for i = 1, select("#", ...) do
					local formatter = select(i, ...)
					if conform.get_formatter_info(formatter, bufnr).available then
						return formatter
					end
				end
				return select(1, ...)
			end
			require("conform").setup({
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					markdown = function(bufnr)
						return { first(bufnr, "prettierd", "prettier"), "injected" }
					end,
					lua = { "stylua" },
					python = { "isort", "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					["_"] = { "prettierd", "prettier", stop_after_first = true },
				},
			})
			-- vim.o.formatexpr = "g/^$/d"
		end,
	},
}
