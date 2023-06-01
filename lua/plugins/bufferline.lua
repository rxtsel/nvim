local M = {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    -- { '<Space>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle pin' },
    -- { '<Space>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete non-pinned buffers' },
    { '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', desc = 'Move to previous buffer' },
    { '<Tab>', '<Cmd>BufferLineCycleNext<CR>', desc = 'Move to next buffer' },
    -- { '<Space>bj', '<Cmd>BufferLinePick<CR>', desc = 'Jump to buffer' },
  },
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      always_show_bufferline = false,
      mode = "tabs",
      separator_style = 'slant',
      always_show_bufferline = false,
      show_buffer_close_icons = false,
      show_close_icon = false,
      color_icons = true
    },
    highlights = {
      separator = {
        fg = '#073642',
        bg = '#002b36',
      },
      separator_selected = {
        fg = '#073642',
      },
      background = {
        fg = '#657b83',
        bg = '#002b36'
      },
      buffer_selected = {
        fg = '#fdf6e3',
        bold = true,
      },
      fill = {
        bg = '#073642'
      }
    }
  },
}

return M
