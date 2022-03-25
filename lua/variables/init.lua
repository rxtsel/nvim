wo = vim.wo
o = vim.o
cmd = vim.cmd
opt = vim.opt
g = vim.g
bo = vim.bo

-- function for maps
map = function(mode, key, result, expr)
	if expr == nil then
		vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = false })
	elseif expr then
		vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true, expr = true })
	end
end
