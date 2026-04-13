vim.lsp.enable({
	"lua_ls",
	"astro",
	"svelte",
	"vtsls",
	"nixd",
	"copilot",
	"tailwindcss",
	"cssls",
})

-- Enable inline diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Extend nvim-lspconfig/lsp/lua_ls.lua config:
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Force virtual style for color highlight
vim.lsp.document_color.enable(true, nil, { style = "virtual" })

-- Enable inline completion for copilot lsp
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufnr = args.buf

		if client.name == "copilot" then
			if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
				vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

				vim.keymap.set(
					"i",
					"<A-l>",
					vim.lsp.inline_completion.get,
					{ buffer = bufnr, desc = "Trigger inline completion" }
				)
				vim.keymap.set(
					"i",
					"<A-]>",
					vim.lsp.inline_completion.select,
					{ buffer = bufnr, desc = "Select next inline completion" }
				)
			end
		end
	end,
})
