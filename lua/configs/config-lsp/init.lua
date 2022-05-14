local Lsp = require("nvim-lsp-installer")
Lsp.setup({
	ensure_installed = { "tsserver", "sumneko_lua", "emmet_ls", "jsonls", "tailwindcss" },
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
	flags = {
		on_attach = on_attach,
		debounce_text_changes = 150,
	},
})

-- DIAGNOSTIC
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- SHOW ICONS IN AUTOCOMPLETE
require("vim.lsp.protocol").CompletionItemKind = {
	"",
	"",
	"ƒ",
	" ",
	"",
	"",
	"",
	"ﰮ",
	"",
	"",
	"",
	"",
	"了",
	" ",
	"﬌ ",
	" ",
	" ",
	"",
	" ",
	" ",
	" ",
	" ",
	"",
	"",
	"<>",
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = { spacing = 5, severity_limit = "Warning" },
	update_in_insert = true,
})

-- CONFIG LANGUAGES-SERVERS

require("utils")

require("lspconfig").emmet_ls.setup({
	filetypes = Rxtsel.emmet.filetypes,
})

require("lspconfig").tsserver.setup({
	filetypes = Rxtsel.tsserver.filetypes,
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	settings = Rxtsel.lua.settings,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").jsonls.setup({
	capabilities = capabilities,
	filetypes = Rxtsel.json.filetypes,
})

--MAPPINGS
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<space>i", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
