local group = vim.api.nvim_create_augroup("RxtselAutocmds", { clear = true })

vim.api.nvim_create_autocmd("PackChanged", {
	group = group,
	callback = function(event)
		local data = event.data
		if data.spec.name == "nvim-treesitter" and (data.kind == "install" or data.kind == "update") then
			vim.cmd.packadd("nvim-treesitter")
			vim.cmd("TSUpdate")
		end
	end,
})

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
