return {
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = false,
				segments = {
	   --   {
	   --   sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
	   --   click = "v:lua.ScSa"
	   -- },
	   { text = {builtin.lnumfunc}, click = "v:lua.ScLa"},
	   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
	   -- {
	   --   sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
	   --   click = "v:lua.ScSa"
	   -- },
				},
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			local ufo = require("ufo")
			vim.o.foldcolumn = "1" -- '0' is not bad
			vim.o.foldlevel = 99
			vim.o.number=true
			vim.o.relativenumber=true
			vim.o.numberwidth=3
			-- vim.wo.foldnestmax = 1
			-- vim.wo.foldminlines = 1
			-- vim.o.foldlevelstart = 99
			-- vim.o.foldenable = true
			vim.o.fillchars  = [[eob: ,fold:\,foldopen:,foldsep: ,foldclose:]]
			-- vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... ' . '(' . (v:foldend - v:foldstart + 1) . ' lines)']]
			-- -- vim.o.fillchars = [[foldopen:,foldclose:]]
			ufo.setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}
