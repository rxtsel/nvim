-- Se require la config de nvimTree
local status_ok, nvimTree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

require("variables")

g.nvim_tree_indent_markers = 1

nvimTree.setup({
	update_cwd = true,
	view = {
		width = 30,
		height = 30,
		hide_root_folder = true,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {},
		},
		number = true,
		relativenumber = true,
	},
	filters = {
		dotfiles = false,
		-- custom = {'__pycache__', 'node_modules'}
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
})
