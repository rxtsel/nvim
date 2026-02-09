-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ timeout = 170 })
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
})

-- Enable automatic treesitter highlighting using Neovim's native API
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end
})
