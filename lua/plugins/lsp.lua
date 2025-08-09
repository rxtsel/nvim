return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	opts = {
		-- options for vim.diagnostic.config()
		inlay_hints = { enabled = false },
		---@type vim.diagnostic.Opts
		-- @type lspconfig.options
		servers = {
			vtsls = {
				settings = {
					typescript = {
						inlayHints = {
							enumMemberValues = { enabled = false },
							functionLikeReturnTypes = { enabled = false },
							parameterNames = { enabled = false },
							parameterTypes = { enabled = false },
							propertyDeclarationTypes = { enabled = false },
							variableTypes = { enabled = false },
						},
					},
				},
			},
		},
	},
}
