-- Rest client
return {
  "mistweaverco/kulala.nvim",
  lazy = true,
  ft = { "http", "rest" },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
  },
}
