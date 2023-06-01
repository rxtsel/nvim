local M = {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      ",f",
      function()
        require("telescope.builtin").find_files({ no_ignore = false, hidden = true })
      end,
      silent = true,
      noremap = true,
      desc = "find files with Telescope",
    },
    {
      ",r",
      function()
        require("telescope.builtin").live_grep()
      end,
      silent = true,
      noremap = true,
      desc = "live grep with Telescope",
    }
  },
  opts = {
    defaults = {
      -- Default from Kickstart.nvim
      file_ignore_patterns = { '.git/', 'docs/' },
      -- mappings = {
      -- },
    },
    pickers = {
      live_grep = {
        find_command = { 'rg', '!**/.git/*' },
      },
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
  end,
}

return M
