local function has_oxfmt_config(_, ctx)
	local config = vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts" }, {
		path = ctx.dirname,
		upward = true,
		type = "file",
	})[1]
	if config then
		return true
	end

	local vite_config = vim.fs.find({ "vite.config.ts", "vite.config.js" }, {
		path = ctx.dirname,
		upward = true,
		type = "file",
	})[1]
	if not vite_config then
		return false
	end
	local ok, lines = pcall(vim.fn.readfile, vite_config)
	return ok and table.concat(lines, "\n"):find("[\"']vite%-plus[\"']") ~= nil
end

local web_formatters = { "oxfmt", "prettierd", "prettier", stop_after_first = true }

require("conform").setup({
	formatters_by_ft = {
		javascript = web_formatters,
		typescript = web_formatters,
		javascriptreact = web_formatters,
		typescriptreact = web_formatters,
		json = web_formatters,
		css = web_formatters,
		scss = web_formatters,
		less = web_formatters,
		html = web_formatters,
		markdown = web_formatters,
		mdx = web_formatters,
		["markdown.mdx"] = web_formatters,
		yaml = web_formatters,
		lua = { "stylua" },
		sh = { "shfmt" },
		fish = { "fish_indent" },
		rust = { "rustfmt" },
		nix = { "alejandra" },
	},
	formatters = {
		oxfmt = { condition = has_oxfmt_config },
	},
	format_on_save = function(bufnr)
		if vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 1000, lsp_format = "fallback" }
	end,
})
