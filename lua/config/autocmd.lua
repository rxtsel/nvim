-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ timeout = 170 })
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

-- Enable automatic treesitter highlighting using Neovim's native API
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- Wrap,linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("BetterReadForTextFiles", { clear = true }),
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
