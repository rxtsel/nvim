require('rxtsel.base')
require('rxtsel.highlights')
require('rxtsel.maps')
require('rxtsel.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac then
  require('rxtsel.macos')
end
if is_win then
  require('rxtsel.windows')
end
if is_wsl then
  require('rxtsel.wsl')
end
