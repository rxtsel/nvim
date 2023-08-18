require 'config.base'
require 'config.lazy'
require 'plugins.lsp'

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require 'config.autocmds'
    require 'config.maps'
  end,
})
