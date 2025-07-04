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
--for spell checking
-- vim.opt.spell = true
