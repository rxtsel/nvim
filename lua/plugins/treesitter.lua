local M = {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    'windwp/nvim-ts-autotag'
  },
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
}

return { M }
