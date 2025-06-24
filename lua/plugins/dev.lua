return {
	dir = "~/Projects/template-string.nvim",
	-- "rxtsel/template-string.nvim",
	ft = { "astro", "svelte", "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	event = { "TextChanged", "TextChangedI" }, -- Or "InsertLeave"
	opts = {
		-- enabled = true, -- Default: true
		-- filetypes = { "astro", "svelte", "vue", "javascript", "typescript", "javascriptreact", "typescriptreact" },
		-- string_node_types = { "string", "string_fragment" }, -- Treesitter node types considered as strings
		-- quotation_marks = { ["'"] = "'", ['"'] = '"' }, -- Opening and closing quotes to detect
		-- debug = false,
		-- log_file = vim.fn.stdpath("cache") .. "/template-string.log",
		-- debounce_ms = 50, -- Time in ms to wait after a change before processing
	},
}
