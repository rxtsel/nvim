local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  --MY PLUGINS HERE!
  use("wbthomason/packer.nvim")
  -- temas
  use {'tanvirtin/monokai.nvim'}
  use {'folke/tokyonight.nvim'}
  use {'rebelot/kanagawa.nvim'}
  use {'ellisonleao/gruvbox.nvim' }
  use {'navarasu/onedark.nvim'}
  -- nvim-tree
  use({"kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons", config = "require('configs.nvimTree')",})
  -- dashboard
  use {'glepnir/dashboard-nvim',
  config = "require('configs.dashboard')"}
  -- resaltado de sintaxis
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {'p00f/nvim-ts-rainbow'}
  use {'windwp/nvim-autopairs'}
  -- barra de estado
  use{	"hoob3rt/lualine.nvim",	requires = {"kyazdani42/nvim-web-devicons", opt = true,},event = "BufWinEnter",config = "require('configs.luaLine')"}
  -- pestañas
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', event = "BufWinEnter", config = require('configs.bufferLine')}
  -- comentarios
  use {'terrortylor/nvim-comment', config = "require('configs.nvimComments')"}
  -- identación
  use {'lukas-reineke/indent-blankline.nvim', config = require('configs.blankLine.init'), event = "BufRead"}
  -- easy motion
  use {'phaazon/hop.nvim', as = 'hop', config = "require('configs.hopNvim')"}
  -- telescope
  use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }, config = "require('configs.telescope')"}
  -- autocompletado (IDE)
  use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
  use {'hrsh7th/nvim-cmp'}
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'saadparwaiz1/cmp_luasnip'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/cmp-cmdline'}
  use {'hrsh7th/cmp-nvim-lua'}
  -- snippets
  use({"hrsh7th/cmp-vsnip"})
  use({"hrsh7th/vim-vsnip"})
  -- presencia en discord
  use {'andweeb/presence.nvim'}
  -- GIT señales
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}, config = "require('configs.gitSigns')"}
  -- ver marcas
  use {'kshenoy/vim-signature'}
  -- multicursor
  use {'mg979/vim-visual-multi'}
  -- sorround
  use {'tpope/vim-surround'}
  -- colorear cierre de etiquetas
  use {'andymass/vim-matchup'}
  -- resaltado de colores
  use {'norcalli/nvim-colorizer.lua'}
  -- toggleterm
  use {'akinsho/toggleterm.nvim'}
  -- pretty-fold
  use {'anuvyklack/pretty-fold.nvim'}
  -- mantener posicion de cursor y folds
  use {'vim-scripts/restore_view.vim'}
  -- notificaciones de nvim
  use("rcarriga/nvim-notify")
  -- others
  -- use {'tribela/vim-transparent'}
  -- use {'rafamadriz/friendly-snippets'}

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
