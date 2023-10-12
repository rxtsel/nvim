return {
  "lukas-reineke/indent-blankline.nvim",
  main = 'ibl',
  opts = {
    scope = { enabled = false },
    indent = {
      char = "│",
      tab_char = "│",
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
}
