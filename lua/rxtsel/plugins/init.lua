vim.pack.add({
	{ src = "https://github.com/craftzdog/solarized-osaka.nvim" },
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/b0o/incline.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/rachartier/tiny-cmdline.nvim" },
})

require("rxtsel.plugins.ui")
require("rxtsel.plugins.navigation")
require("rxtsel.plugins.syntax")

require("rxtsel.plugins.keymaps")
