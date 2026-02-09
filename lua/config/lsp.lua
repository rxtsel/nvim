vim.lsp.enable({
	"lua_ls",
	"astro",
	"svelte",
	"vtsls",
	"nixd",
	"copilot",
	"tailwindcss",
	"cssls"
})

-- Enable inline diagnostics
vim.diagnostic.config({ virtual_text = true })

-- Extend nvim-lspconfig/lsp/lua_ls.lua config:
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

-- Document color
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/documentColor") then
			vim.lsp.document_color.enable(true, args.buf, { style = "virtual" })
		end
	end
})
