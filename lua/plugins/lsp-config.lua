return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim",
		"nvimtools/none-ls-extras.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		{
			"folke/lazydev.nvim",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local ensure_installed = {
			"bashls",
			"ts_ls",
			"lua_ls",
			"stylua",
			"prettier",
			"prettierd",
			"tailwindcss",
			"eslint-lsp",
		}
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		local lspconfig = require("lspconfig")
		local lsp_configurations = require("lspconfig.configs")

		if not lsp_configurations.cspell_lsp then
			lsp_configurations.cspell_lsp = {
				default_config = {
					cmd = { "cspell-lsp", "--stdio" },
					filetypes = {
						"typescriptreact",
						"go",
						"rust",
						"js",
						"ts",
						"html",
						"css",
						"json",
						"yaml",
						"markdown",
						"gitcommit",
					},
					root_dir = require("lspconfig.util").root_pattern(".git"),
				},
			}
		end
		lspconfig.cspell_lsp.setup({})
		lspconfig.lua_ls.setup({})
		lspconfig.bashls.setup({})
		lspconfig.eslint.setup({})
		lspconfig.tailwindcss.setup({})
		lspconfig.ts_ls.setup({
			opts = {
				server = {
					vtsls = {
						filetypes = {
							"javascript",
							"javascriptreact",
							"javascript.jsx",
							"typescript",
							"typescriptreact",
							"typescript.tsx",
						},
						settings = {
							complete_function_calls = true,
							vtsls = {
								enableMoveToFileCodeAction = true,
								autoUseWorkspaceTsdk = true,
								experimental = {
									maxInlayHintLength = 30,
									completion = {
										enableServerSdeFuzzyMatch = true,
									},
								},
							},
							typescrpt = {
								updateImportsOnFleMove = { enabled = "always" },
								suggest = {
									completeFunctonCalls = true,
								},
								inlayHints = {
									enumMemberValues = { enabled = true },
									functionLikeReturnTypes = { enabled = true },
									parameterNames = { enabled = "literals" },
									parameterTypes = { enabled = true },
									propertyDeclarationTypes = { enabled = true },
									variableTypes = { enabled = false },
								},
							},
						},
					},
				},
			},
		})
		vim.diagnostic.config({
			severity_sort = true,
			underline = true,
			virtual_lines = true,
			float = { border = "rounded", source = "if_many" },
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			},
		})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
	end,
}
