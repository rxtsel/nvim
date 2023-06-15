return {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = {
    'windwp/nvim-ts-autotag'
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "tsx",
        "typescript",
        "javascript",
        "json",
        "yaml",
        "css",
        "html",
        "lua",
        "astro"
      },
      autotag = {
        enable = true,
      }
    }

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}
