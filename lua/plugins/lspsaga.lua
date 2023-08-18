return {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        border = 'rounded',
      },
      symbol_in_winbar = {
        enable = false
      },
      lightbulb = {
        enabled = false,
      },
      outline = {
        layout = 'float'
      },
      breadcrumb = {
        enable = false
      },
      diagnostic = {
        keys = {
          quit = {'q', '<Esc>'},
        }
      },
      code_action = {
        keys = {
          quit = {'q', '<Esc>'},
        }
      }
    })
    require('lspsaga.diagnostic')

    local opts = { noremap = true, silent = true }

    vim.keymap.set('n', '<C-h>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    vim.keymap.set('n', '<C-t>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
    vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
    vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
    vim.keymap.set('n', 'gt', '<Cmd>Lspsaga goto_type_definition<CR>', opts)
    vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
    vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
    vim.keymap.set('n' , '<Space>ca', '<cmd>Lspsaga code_action<CR>', opts)
    vim.keymap.set({'n','t'}, '<Space>t', '<cmd>Lspsaga term_toggle<CR>', opts)
  end,
}
