local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")

	local formatting = null_ls.builtins.formatting

	null_ls.setup({
		sources = {
			formatting.stylua,
			formatting.prettierd,
			null_ls.builtins.diagnostics.eslint_d.with({
				diagnostics_format = "[eslint] #{m}\n(#{c})",
			}),
			null_ls.builtins.completion.spell,
		},
	})
end

return M
