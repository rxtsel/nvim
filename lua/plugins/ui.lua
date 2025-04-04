return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local LazyVim = require("lazyvim.util")
      opts.sections.lualine_c[4] = {
        LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 ",
        }),
      }

      -- remove navic from lualine
      table.remove(opts.sections.lualine_c)
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      status_column = { enable = true },
      bigfile = { enable = true },
      quickfile = { enable = true },
      words = { enable = true },
      indent = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      notifier = {
        enable = true,
        tob_down = false,
        timeout = 3000,
      },
      image = {
        doc = {
          enable = true,
          inline = false,
          float = true,
          max_width = 60,
          max_height = 30,
          image_plugin_enabled = true,
        },
      },
      picker = {
        enable = true,
        sources = {
          explorer = {
            replace_netrw = true,
            enable = true,
            layout = { layout = { position = "right" } },
            auto_close = true,
          },
        },
      },
      dashboard = {
        enable = true,
        preset = {
          header = [[
██████╗ ██╗  ██╗████████╗███████╗███████╗██╗     
██╔══██╗╚██╗██╔╝╚══██╔══╝██╔════╝██╔════╝██║     
██████╔╝ ╚███╔╝    ██║   ███████╗█████╗  ██║     
██╔══██╗ ██╔██╗    ██║   ╚════██║██╔══╝  ██║     
██║  ██║██╔╝ ██╗   ██║   ███████║███████╗███████╗
╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚══════╝
      ]],
        },
      },
    },
    keys = {
      -- Top Pickers & Explorer
      {
        "<leader><space>",
        enable = false,
      },
      {
        "<leader>n",
        enable = false,
      },
      {
        "<leader>,",
        enable = false,
      },
      {
        "<leader>/",
        enable = false,
      },
      {
        ";F",
        function()
          Snacks.picker.smart()
        end,
        desc = "Smart Find Files",
      },
      {
        ";f",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
      {
        ";b",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        ";r",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        ";:",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        ";n",
        function()
          Snacks.picker.notifications()
        end,
        desc = "Notification History",
      },
      {
        "<leader>e",
        function()
          Snacks.explorer()
        end,
        desc = "File Explorer",
      },
    },
  },
}
