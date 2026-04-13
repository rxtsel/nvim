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

vim.lsp.document_color.enable(true, { style = "virtual" })
