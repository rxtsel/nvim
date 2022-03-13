require'nvim-treesitter.configs'.setup {
  ensure_installed = {"css", "javascript", "json", "lua",},
  sync_install = false,
  highlight = {enable = true, additional_vim_regex_highlighting = true},
  -- Plugin de rainbow de treesitter
  rainbow = {
    enable = true,
    extended_mode = false, -- Mejora el resaltado de sintaxis en html
    max_file_lines = nil,
    disable = {"html"}
  },
  -- Plugin de autopairs de treesitter
  autopairs = {enable = true},
  matchup = {
    enable = true
  }
}
