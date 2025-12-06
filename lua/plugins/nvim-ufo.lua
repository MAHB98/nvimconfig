return {
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = false,
				segments = {
					{
						-- text = { builtin.signfunc },
						sign = {
							namespace = { "git", "diagnostic" },
							colwidth = 1,
							maxwidth = 1,
							auto = true,
						},
						click = "v:lua.ScSa",
					},
					{ text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{ text = { "%=" }, click = "v:lua.ScNa" },
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
			vim.o.number = true
			vim.o.relativenumber = true
			vim.o.numberwidth = 3
			-- vim.wo.foldnestmax = 1
			-- vim.wo.foldminlines = 1
			-- vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.fillchars = [[eob: ,fold:\,foldopen:,foldsep: ,foldclose:]]
			-- vim.o.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').' ... ' . '(' . (v:foldend - v:foldstart + 1) . ' lines)']]
			-- -- vim.o.fillchars = [[foldopen:,foldclose:]]
			ufo.setup({

				fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
					local folded_line = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]
					local suffix = (" ⮞ %d lines: %s"):format(endLnum - lnum + 1, folded_line)
					local newVirtText = {}

					table.insert(newVirtText, { suffix, "MoreMsg" })
					return newVirtText
				end,
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},
}
