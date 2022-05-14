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
  extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
			find_cmd = "rg",
		},
	},
})

require('telescope').load_extension('media_files')
