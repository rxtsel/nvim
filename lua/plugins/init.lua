return {
  'nvim-lua/plenary.nvim',

  {
      'williamboman/mason.nvim',
      build = ':MasonUpdate'
    },

    'williamboman/mason-lspconfig.nvim',

  -- 'numToStr/Comment.nvim', -- potentially remove this...
  'tpope/vim-rhubarb',
  'prisma/vim-prisma',
  'tpope/vim-sleuth',

  -- comments
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },

  -- ui components
  { 'MunifTanjim/nui.nvim', lazy = true },
}
