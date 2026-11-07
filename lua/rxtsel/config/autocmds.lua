local group = vim.api.nvim_create_augroup("RxtselAutocmds", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = group,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
	group = group,
	callback = function(event)
		vim.wo.cursorline = event.event == "WinEnter"
	end,
})
