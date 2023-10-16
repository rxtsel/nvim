local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics

		return {
			root_dir = require("null-ls.utils").root_pattern("stylua.toml", ".git"),
			sources = {
				formatting.prettierd,
				formatting.stylua,
				diagnostics.eslint_d.with({
					diagnostics_format = "[eslint] #{m}\n(#{c})",
				}),
			},
			on_attach = function(client, bufnr)
				-- Enable formatting on sync
				if client.supports_method("textDocument/formatting") then
					local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = format_on_save,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								bufnr = bufnr,
								filter = function(_client)
									return _client.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
			debug = true,
		}
	end,
	config = function(_, opts)
		require("null-ls").setup(opts)
	end,
}

return M
