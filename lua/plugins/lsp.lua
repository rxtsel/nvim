---@diagnostic disable: missing-fields
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			diagnostics = {
				virtual_text = { prefix = "icons" },
			},
			inlay_hints = { enabled = false },
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = false,
					},
				},
			},
		},
	},

	-- {
	-- 	"stevearc/conform.nvim",
	-- 	optional = true,
	-- 	opts = {
	-- 		formatters_by_ft = {
	-- 			["javascript"] = { "biome" },
	-- 			["javascriptreact"] = { "biome" },
	-- 			["typescript"] = { "prettier" },
	-- 			["typescriptreact"] = { "prettier" },
	-- 		},
	-- 	},
	-- },
}
