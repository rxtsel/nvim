local IGNORED_FILES = {
	["node_modules"] = true,
	[".git"] = true,
	[".DS_Store"] = true,
	[".opencode"] = true,
	[".svelte-kit"] = true,
	[".vscode"] = true,
	[".direnv"] = true,
}

require("oil").setup({
	columns = { "icon" },
	view_options = {
		show_hidden = true,
		is_always_hidden = function(name, _)
			return IGNORED_FILES[name] == true
		end,
	},
})
