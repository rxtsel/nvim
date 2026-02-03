vim.lsp.enable({ "lua_ls", "astro", "svelte", "vtsls", "nixd", "copilot", "tailwindcss", "cssls" })

vim.diagnostic.config({ virtual_text = true })

-- Document color
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, args.buf, { style = "󱓻 " })
		end
	end,
})

-- Disabled warning for vim global var
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
