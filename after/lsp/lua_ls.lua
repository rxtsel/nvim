return {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				library = { vim.env.VIMRUNTIME },
				checkThirdParty = false,
			},
			hint = {
				enable = true,
				paramType = true,
			},
			diagnostics = {
				globals = { "vim", "Rxtsel" },
				disable = { "missing-fields", "unused-local", "unused-function" },
			},
		},
	},
}
