require("nvim-treesitter.install").check_cli = false

require("nvim-treesitter.config").setup({
	highlight = {
		enable = true,
	},
	ensure_installed = {
		"svelte",
		"html",
		"javascript",
		"css",
		"tsx",
		"typescript",
	},
})
