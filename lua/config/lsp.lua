vim.lsp.enable({ "lua_ls", "astro", "svelte", "vtsls", "nixd" })

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
