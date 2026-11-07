local language_settings = {
	updateImportsOnFileMove = { enabled = "always" },
	suggest = { completeFunctionCalls = true },
	inlayHints = {
		variableTypes = { enabled = false },
	},
}

return {
	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = { enableServerSideFuzzyMatch = true },
				maxInlayHintLength = 30,
			},
		},
		typescript = language_settings,
		javascript = vim.deepcopy(language_settings),
	},
}
