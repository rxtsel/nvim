return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      term_colors = true,
      flavour = "mocha",
    }
    vim.cmd([[colorscheme catppuccin]])
  end
}
