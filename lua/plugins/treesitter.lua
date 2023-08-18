return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag'
  },
  config = function()
    require('nvim-treesitter.configs').setup {
      modules = {},
      sync_install = false,
      ignore_install = {},
      auto_install = true,
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
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    }

    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
  end
}
