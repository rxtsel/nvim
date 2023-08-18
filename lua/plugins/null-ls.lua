local M = {
  'jose-elias-alvarez/null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  lazy = true,
  dependencies = {
    'williamboman/mason.nvim',
  },
  opts = function()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    return {
      root_dir = require('null-ls.utils').root_pattern('stylua.toml', '.git'),
      sources = {
        formatting.prettierd,
        null_ls.builtins.diagnostics.eslint_d.with({
          diagnostics_format = '[eslint] #{m}\n(#{c})'
        })
      },
      debug = true,
    }
  end,
  config = function(_, opts)
    require('null-ls').setup(opts)
  end,
}

return M
