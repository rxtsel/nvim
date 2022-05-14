require 'nvim-treesitter.install'.compilers = { "gcc" }

require 'nvim-treesitter.configs'.setup {
  -- ensure_installed = {"javascript", "typescript"}, -- "all" instala todos los lenguajes
  ensure_installed = "all", -- "all" instala todos los lenguajes
  ignore_install = { "phpdoc" },
  indent = { enable = false },
  highlight = { enable = true },
  autotag = { enable = true },
  endwise = { enable = true },
  rainbow = { enable = true, extended_mode = false, disable = { "html" } },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner'
    }
  } }
