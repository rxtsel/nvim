vim.lsp.enable({ "lua_ls", "astro", "svelte", "vtsls", "nixd", "copilot" })

vim.diagnostic.config({ virtual_text = true })

-- Disabled warning for vim global var
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
		},
	},
})
