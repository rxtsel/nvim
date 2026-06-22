-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ timeout = 170 })
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

-- Fix `oxlint --fix` on save if the project has an oxlint config file
local function root_has_oxlint(path)
	return vim.fs.find({
		".oxlintrc.json",
		".oxlintrc.jsonc",
		"oxlint.config.ts",
	}, {
		upward = true,
		path = path,
		stop = vim.loop.os_homedir(),
	})[1] ~= nil
end

vim.api.nvim_create_autocmd("BufWritePre", {
	group = vim.api.nvim_create_augroup("OxlintFixOnSave", { clear = true }),
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.vue", "*.svelte", "*.astro" },
	callback = function(args)
		local path = vim.fs.dirname(vim.api.nvim_buf_get_name(args.buf))
		if not root_has_oxlint(path) then
			return
		end

		local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "oxlint" })
		if #clients == 0 then
			return
		end

		clients[1]:request_sync("workspace/executeCommand", {
			command = "oxc.fixAll",
			arguments = {
				{
					uri = vim.uri_from_bufnr(args.buf),
					version = vim.lsp.util.buf_versions[args.buf],
				},
			},
		}, 1000, args.buf)
	end,
})

-- Enable automatic treesitter highlighting using Neovim's native API
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		pcall(vim.treesitter.start, args.buf)
	end,
})

-- Wrap,linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("BetterReadForTextFiles", { clear = true }),
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

-- Wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("wrap_spell", { clear = true }),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.spell = true
	end,
})
