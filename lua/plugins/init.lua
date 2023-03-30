return {
  'glepnir/lspsaga.nvim',  -- LSP UIs
  'onsails/lspkind-nvim',  -- vscode-like pictograms
  'folke/lsp-colors.nvim', -- LSP diagnostics colors
  {
    "L3MON4D3/LuaSnip",
    version = "1.2.1",
    build = "make install_jsregexp"
  },
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp'
    }
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    }
  },
  'b0o/schemastore.nvim', -- json schemas to use with lspconfig
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'MunifTanjim/prettier.nvim',       -- Prettier plugin for Neovim',s built-in LSP client
  'kyazdani42/nvim-tree.lua',

  {
    'numToStr/Comment.nvim',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },

  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },

  'akinsho/nvim-bufferline.lua',

  'norcalli/nvim-colorizer.lua',

  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  },
  'dinhhuy258/git.nvim', -- For git blame & browse

  'phaazon/hop.nvim',

  'terryma/vim-multiple-cursors',

  'andweeb/presence.nvim',
}
