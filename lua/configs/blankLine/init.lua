-- Configuración indent blankline
local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent.setup({
	buftype_exclude = { "terminal", "nofile",  "toggleterm"},
	filetype_exclude = { "dashboard" },
	show_end_of_line = true,
})

vim.opt.list = true
