require("gitsigns").setup({})
require("gitlinker").setup({})

require("codediff").setup({
	explorer = {
		view_mode = "tree",
		width = 50,
		auto_open_on_cursor = true,
		line_stats = { enabled = true },
	},
	diff = {
		layout = "side-by-side",
		compact = true,
		compact_context_lines = 8,
		compact_sync_folds = true,
	},
})

require("mini.diff").setup({
	mappings = {
		apply = "",
		reset = "",
		textobject = "",
		goto_first = "",
		goto_prev = "",
		goto_next = "",
		goto_last = "",
	},
})
