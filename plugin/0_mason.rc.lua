local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup {}

lspconfig.setup {
  ensure_installed = {
    'tailwindcss',
    'lua_ls',
    'astro',
    'tsserver',
    'emmet_ls',
    'jsonls',
    'cssls',
  },
  automatic_installation = true
}

require 'lspconfig'.tailwindcss.setup {}
