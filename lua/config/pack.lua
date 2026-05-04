local gh = function(x)
	return "https://github.com/" .. x
end

vim.pack.add({
	{ src = gh("craftzdog/solarized-osaka.nvim") },
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("nvim-mini/mini.nvim") },
	{ src = gh("saghen/blink.cmp") },
	{ src = gh("saghen/blink.lib") },
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("lewis6991/gitsigns.nvim") },
	{ src = gh("kdheepak/lazygit.nvim") },
	{ src = gh("mistweaverco/kulala.nvim") },
	{ src = gh("vyfor/cord.nvim") },
	{
		src = gh("mrcjkb/rustaceanvim"),
		version = vim.version.range("^9"),
	},
})
