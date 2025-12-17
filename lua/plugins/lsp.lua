return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
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
			"cspell-lsp",
			"beautysh",
			"sqlfmt",
			"fixjson",
			"css-lsp",
			"rust-analyzer",
			"rustfmt",
			"codelldb",
		}
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
		vim.keymap.set("n", "jd", vim.lsp.buf.definition)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
	end,
}
