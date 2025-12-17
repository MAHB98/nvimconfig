require("config.lazy")
--for bufferline
vim.opt.termguicolors = true
-- for undo-tree
if vim.fn.has("persistent_undo") == 1 then
	local target_path = vim.fn.expand("~/.undodir")
	if vim.fn.isdirectory(target_path) == 0 then
		vim.fn.mkdir(target_path, "p", "0700")
	end
	vim.o.undodir = target_path
	vim.o.undofile = true
end
--for highlight on_yank
vim.api.nvim_set_hl(0, "YankHighlight", { bg = "#cc5050", bold = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "YankHighlight",

			timeout = 200,
		})
	end,
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint")
vim.lsp.enable("bashls")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("cssls")
vim.lsp.enable("cspel_lsp")

--for spell checking
-- vim.opt.spell = true
-- vim.o.colorcolumn = "80,99"
