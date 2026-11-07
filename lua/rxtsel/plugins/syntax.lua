require("todo-comments").setup({})

local treesitter = require("nvim-treesitter")
treesitter.setup({})
treesitter.install({
	"astro",
	"bash",
	"css",
	"diff",
	"fish",
	"gitignore",
	"go",
	"html",
	"http",
	"javascript",
	"jsdoc",
	"json",
	"lua",
	"luadoc",
	"luap",
	"markdown",
	"markdown_inline",
	"printf",
	"python",
	"query",
	"regex",
	"rust",
	"scss",
	"sql",
	"svelte",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("RxtselTreesitter", { clear = true }),
	callback = function(event)
		local ok, parser = pcall(vim.treesitter.get_parser, event.buf)
		if not ok or not parser then
			return
		end
		vim.treesitter.start(event.buf)
		vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
