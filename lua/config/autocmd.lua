-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ timeout = 170 })
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
})

-- Copilot
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then return end

		if client.name == "copilot"
				and client:supports_method(
					vim.lsp.protocol.Methods.textDocument_inlineCompletion,
					args.buf
				)
		then
			-- Enable inline completion
			vim.lsp.inline_completion.enable(true, { bufnr = args.buf })

			-- Accept suggestion
			vim.keymap.set(
				"i",
				"<M-l>",
				vim.lsp.inline_completion.get,
				{ buffer = args.buf, desc = "Copilot: accept inline suggestion" }
			)

			-- Cycle suggestions
			vim.keymap.set(
				"i",
				"<M-g>",
				vim.lsp.inline_completion.select,
				{ buffer = args.buf, desc = "Copilot: cycle inline suggestion" }
			)
		end
	end,
})
