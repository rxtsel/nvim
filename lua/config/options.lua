vim.g.mapleader = " "

vim.opt.backup = true
vim.opt.cmdheight = 0
vim.opt.backupdir = vim.fn.stdpath("state") .. "/backup"
vim.opt.mousescroll = "ver:1,hor:4"
vim.opt.colorcolumn = "80"

-- Enable this option to avoid conflicts with Prettier.
vim.g.lazyvim_prettier_needs_config = true

-- Make all keymaps silent by default
local keymap_set = vim.keymap.set
---@diagnostic disable-next-line: duplicate-set-field
vim.keymap.set = function(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	return keymap_set(mode, lhs, rhs, opts)
end

if vim.fn.has("win32") == 1 then
	LazyVim.terminal.setup("pwsh")
end

vim.g.deprecation_warnings = true
