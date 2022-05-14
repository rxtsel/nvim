local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	--MY PLUGINS HERE!
	use("wbthomason/packer.nvim")
	-- THEMES
	use({ "overcache/NeoSolarized" })
	use({ "catppuccin/nvim" })
	use({ "rose-pine/neovim" })
	-- NVIM-TREE
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "kyazdani42/nvim-web-devicons" })
	-- SYNTAX HIGHLITING
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-autopairs" })
	use({ "norcalli/nvim-colorizer.lua" })
	use("lukas-reineke/indent-blankline.nvim")
	use({ "andymass/vim-matchup" })
	use({ "tpope/vim-surround" })
	-- STATUS BARS
	use("tamton-aquib/staline.nvim")
	-- TABS
	use({ "akinsho/bufferline.nvim" })
	-- COMMMENTS
	use({ "terrortylor/nvim-comment" })
	-- TELESCOPE
	use({ "nvim-telescope/telescope.nvim" })
	use({ "nvim-lua/popup.nvim" })
	use({ "nvim-telescope/telescope-media-files.nvim" })
	-- AUTOCOMPLETE AND AUTOSUGESTION (IDE)
	use({
		"williamboman/nvim-lsp-installer",
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("nvim-lsp-installer").setup({})
				local lspconfig = require("lspconfig")
				lspconfig.sumneko_lua.setup({})
			end,
		},
	})
	use("onsails/lspkind-nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use({ "hrsh7th/cmp-path" })
	use("windwp/nvim-ts-autotag")
	use("tami5/lspsaga.nvim")
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	-- GIT SINGNS
	use({ "tpope/vim-fugitive" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	-- TERM
	use({
		"akinsho/toggleterm.nvim",
		tag = "v1.*",
		config = function()
			require("toggleterm").setup()
		end,
	})
	-- DASHBOARD
	-- dashboard
	use({ "glepnir/dashboard-nvim" })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
