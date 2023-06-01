local M = {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'windwp/nvim-autopairs',
    'hrsh7th/cmp-nvim-lsp',
    -- 'hrsh7th/cmp-path',
    'onsails/lspkind-nvim',
  },
  opts = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    return {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<CR>'] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        }),
        ['<C-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<C-p>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),
      sources = {
        -- { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
      formatting = {
        format = function(_, item)
          local icons = require('config').icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
      experimental = {
        native_menu = false,
        ghost_text = false,
      },
    }
  end,
  config = function(_, opts)
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    --    local autopairs = require('nvim-autopairs')
    --    local autopairs_completion = require("nvim-autopairs.completion.cmp")

    luasnip.config.setup({})
    cmp.setup(opts)

    -- Configure autopairs
    --    autopairs.setup ({
    --      check_ts = true,
    --    })
    --    autopairs_completion.setup({
    --      map_cr = true,   --  map <CR> on insert mode
    --      map_complete = true, -- it will auto insert `(` after select function or method item
    --      auto_select = true -- automatically select the first item
    --    })
  end,
}

return M
