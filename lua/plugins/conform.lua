local function root_has_file(filenames)
	return vim.fs.find(filenames, {
		upward = true,
		path = vim.fn.expand("%:p:h"),
		stop = vim.loop.os_homedir(),
	})[1] ~= nil
end

local function pick_web_formatters()
	if root_has_file({ "biome.json", "biome.jsonc" }) then
		return { "biome" }
	end

	if root_has_file({ ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" }) then
		return { "oxfmt" }
	end

	if
		root_has_file({
			".prettierrc",
			".prettierrc.json",
			".prettierrc.jsonc",
			".prettierrc.js",
			".prettierrc.cjs",
			".prettierrc.mjs",
			"prettier.config.js",
			"prettier.config.cjs",
			"prettier.config.mjs",
		})
	then
		return { "prettierd" }
	end

	return { "oxfmt", "biome", "prettierd", stop_after_first = true }
end

require("conform").setup({
	formatters_by_ft = {
		javascript = pick_web_formatters,
		javascriptreact = pick_web_formatters,
		typescript = pick_web_formatters,
		typescriptreact = pick_web_formatters,
		json = pick_web_formatters,
		html = pick_web_formatters,
		css = pick_web_formatters,
		astro = pick_web_formatters,
		svelte = pick_web_formatters,

		lua = { "stylua" },
		rust = { "rustfmt" },
		nix = { "alejandra" },
	},

	formatters = {
		biome = {
			command = "biome",
			require_cwd = false,
		},
		oxfmt = {
			command = "oxfmt",
			require_cwd = false,
		},
		prettierd = {
			command = "prettierd",
			require_cwd = false,
		},
	},

	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})
