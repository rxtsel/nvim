return {
  "LazyVim/LazyVim",
  dependencies = {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  opts = {
    colorscheme = "solarized-osaka",
  },
}
