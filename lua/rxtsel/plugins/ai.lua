local server = vim.fn.exepath("copilot-language-server")

require("copilot").setup({
	panel = { enabled = false },
	suggestion = {
		enabled = true,
		auto_trigger = true,
		keymap = {
			accept = false,
			accept_word = false,
			accept_line = false,
			next = false,
			prev = false,
			dismiss = false,
		},
	},
	filetypes = {
		markdown = true,
		help = true,
	},
	should_attach = function(bufnr)
		local buffer = vim.bo[bufnr]
		return buffer.filetype == "help" or (buffer.buflisted and buffer.buftype == "")
	end,
	server = server ~= "" and { type = "binary", custom_server_filepath = server } or nil,
})
