require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		javascript = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		javascriptreact = { "biome" },
		astro = { "prettierd" },
		svelte = { "prettierd" },
		json = { "biome" },
		html = { "biome" },
		css = { "biome" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
