return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ["q"] = actions.close
          },
        },
      }
    })
  end,
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
}
