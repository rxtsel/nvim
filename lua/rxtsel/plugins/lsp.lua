local nix_managed = vim.env.RXTSEL_NVIM_NIX == "1"

require("mason").setup({
	PATH = nix_managed and "skip" or "prepend",
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"lua-language-server",
		"vtsls",
		"eslint-lsp",
		"oxlint",
		"tailwindcss-language-server",
		"css-lsp",
		"rust-analyzer",
		"copilot-language-server",
		"prettier",
		"prettierd",
		"oxfmt",
		"stylua",
		"shfmt",
	},
	auto_update = false,
	-- The Nix wrapper supplies the same tools through its pinned PATH.
	run_on_start = not nix_managed,
})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	virtual_text = {
		prefix = "●",
		source = "if_many",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = Rxtsel.icons.diagnostics.Error,
			[vim.diagnostic.severity.WARN] = Rxtsel.icons.diagnostics.Warn,
			[vim.diagnostic.severity.INFO] = Rxtsel.icons.diagnostics.Info,
			[vim.diagnostic.severity.HINT] = Rxtsel.icons.diagnostics.Hint,
		},
	},
})

vim.lsp.config("*", {
	capabilities = {
		workspace = {
			fileOperations = {
				didRename = true,
				willRename = true,
			},
		},
	},
})

vim.lsp.enable({
	"eslint",
	"oxlint",
	"lua_ls",
	"cssls",
	"vtsls",
	"tailwindcss",
	"rust_analyzer",
})
