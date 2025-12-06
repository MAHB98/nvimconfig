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
			condition = function(buf)
				local excluded_filetypes = {
					-- this one is especially useful if you use neovim as a commit message editor
					"gitcommit",
					-- most of these are usually set to non-modifiable, which prevents autosaving
					-- by default, but it doesn't hurt to be extra safe.
					"NvimTree",
					"Outline",
					"TelescopePrompt",
					"alpha",
					"dashboard",
					"lazygit",
					"neo-tree",
					"oil",
					"prompt",
					"toggleterm",
					"sql",
					"query",
					"mysql",
				}

				local excluded_filenames = {
					"do-not-autosave-me.lua",
					"~/../../tmp/*",
				}
				if
					vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, "&filetype"))
					or vim.tbl_contains(excluded_filenames, vim.fn.expand("%:t"))
				then
					return false
				elseif vim.fn.getbufvar(buf, "&buftype") ~= "" then
					return false
				end
				return true
			end,
		},
	},
	{
		"stevearc/conform.nvim",
		---@module "conform"
		---@type conform.setupOpts
		opts = {},
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>F",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
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
					bash = { "shfmt" },

					json = { "fixjson" },
					sql = { "sqlfmt" },
					mysql = { "sqlfmt" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				},
			})
		end,
	},
}
