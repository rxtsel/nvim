-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable autoformat for http/rest files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "http", "rest" },
	callback = function()
		vim.b.autoformat = false
	end,
})
