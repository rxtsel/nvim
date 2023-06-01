require('config.base')
require('config.lazy')
require('plugins.lsp')

-- lazy.nvim will call the User autocommand after lazy has loaded
vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    require 'config.autocmds'
    require 'config.maps'
  end,
})

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac then
  require('config.macos')
end
if is_win then
  require('config.windows')
end
if is_wsl then
  require('config.wsl')
end
