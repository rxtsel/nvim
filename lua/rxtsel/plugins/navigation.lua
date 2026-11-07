require("oil").setup({
	default_file_explorer = true,
	columns = { "icon", "permissions", "size", "mtime" },
	view_options = { show_hidden = true },
	lsp_file_methods = {
		enabled = true,
		autosave_changes = true,
	},
	float = {
		max_width = 200,
		border = "rounded",
	},
	preview_win = { update_on_cursor_moved = true },
})
