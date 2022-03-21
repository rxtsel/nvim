-- Configuración de telescope
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = " ",
		selection_caret = "> ",
		file_ignore_patterns = { ".git", "node_modules", "__pycache__" },
	},
	pickers = {
		find_files = {
			theme = "dropdown",
		},
		buffers = {
			theme = "dropdown",
		},
		live_grep = {
			theme = "dropdown",
		},
		oldfiles = {
			theme = "dropdown",
		},
	},
})
