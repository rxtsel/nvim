require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt" },
		javascript = { "biome" },
		javascriptreact = { "biome" },
		typescript = { "biome" },
		typescriptreact = { "biome" },
		json = { "biome" },
		html = { "biome" },
		css = { "biome" },
		astro = { "prettierd" },
		svelte = { "prettierd" },
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})
