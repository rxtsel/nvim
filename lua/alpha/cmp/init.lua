local cmp = require "cmp"
local lspkind = require "lspkind"
local luasnip = require "luasnip"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local compare = require "cmp.config.compare"

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets" })
-- require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets/javascript" })

cmp.setup {
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.close()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.choice_active() then
        luasnip.change_choice(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<c-space>"] = cmp.mapping.complete(),
  },
  sources = {
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    {
      name = "buffer",
      keyword_length = 4,
      option = {
        get_bufnrs = function()
          local bufs = {}
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local bufnr = vim.api.nvim_win_get_buf(win)
            if vim.api.nvim_buf_get_option(bufnr, 'buftype') ~= 'terminal' then
              bufs[bufnr] = true
            end
          end
          return vim.tbl_keys(bufs)
        end,
      },
    },
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = false,
      maxwidth = 50,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[snip]",
      },
    },
  },

  sorting = {
    priority_weight = 2,
    comparators = {
      compare.kind,
      compare.sort_text,
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = false,
  },
}
