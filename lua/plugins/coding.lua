return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "krivahtoo/silicon.nvim",
    lazy = true,
    build = "./install.sh",
    cmd = "Silicon",
    config = function()
      local themepath = "extras/sublime/solarized-osaka_storm.tmTheme"
      local solarized = vim.fn.stdpath("data") .. "/lazy/solarized-osaka.nvim/" .. themepath

      require("silicon").setup({
        font = "MonaspiceNe Nerd Font",
        background = "#1d1d1d",
        line_number = true,
        theme = solarized,
        gobble = true,
        output = {
          clipboard = false,
          path = "/mnt/c/Users/rxtsel/Pictures/Screenshots",
          format = "nvim_[year][month][day]_[hour][minute][second].png",
          file = "<path>/<format>",
        },
        watermark = {
          text = "@rxtsel",
          color = "#f5f5f5",
        },
        window_title = function()
          return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
        end,
      })
    end,
  },
}
