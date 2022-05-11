local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  --MY PLUGINS HERE!
  use("wbthomason/packer.nvim")
  -- temas
  use {'overcache/NeoSolarized'}
  use { 'catppuccin/nvim'}
  use { 'rose-pine/neovim'}
  -- nvim-tree
  use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = "require('configs.config-nvim-tree')",})
  -- resaltado de sintaxis
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs'}
  -- barra de estado
  use 'tamton-aquib/staline.nvim'
  -- pestañas
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- comentarios
  use {'terrortylor/nvim-comment', config = "require('configs.nvimComments')"}
  -- telescope
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'}, { "nvim-lua/popup.nvim" }, { "nvim-telescope/telescope-media-files.nvim" } }, config = "require('configs.config-telescope')"}
  -- autocompletado (IDE)
  use {'neovim/nvim-lspconfig'}
  use {"williamboman/nvim-lsp-installer"}
  use 'onsails/lspkind-nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use {'hrsh7th/cmp-path'}
  use 'windwp/nvim-ts-autotag'
  use 'tami5/lspsaga.nvim'
  use { 'hrsh7th/cmp-vsnip'}
  use { 'hrsh7th/vim-vsnip'}
  -- GIT señales
  use {'tpope/vim-fugitive'}
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = "require('configs.config-git-signs')"}
  -- sorround
   use {'tpope/vim-surround'}
  -- colorear cierre de etiquetas
  use {'andymass/vim-matchup'}
  -- resaltado de colores
  use {'norcalli/nvim-colorizer.lua'}
  use "lukas-reineke/indent-blankline.nvim"

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
