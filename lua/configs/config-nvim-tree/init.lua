local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvimtree.setup({
	filters = { custom = { "*.tmp" } },
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = { "dashboard" },
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
	system_open = {
		cmd = nil,
		args = {},
	},
	view = {
		width = 40,
		side = "left",
		mappings = { custom_only = false, list = {} },
	},
	renderer = {
		indent_markers = { enable = true, icons = { corner = "└ ", edge = "│ ", none = "  " } },
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})
vim.cmd([[
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
