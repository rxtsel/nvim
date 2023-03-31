return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'windwp/nvim-autopairs',
    'onsails/lspkind-nvim',
    {
      "L3MON4D3/LuaSnip",
      version = "v1.*",
      build = "make install_jsregexp"
    }
  }
}
