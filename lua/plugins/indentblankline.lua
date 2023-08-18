return {
  "lukas-reineke/indent-blankline.nvim",
  config = {
    show_end_of_line = false,
    show_current_context = true,
    buftype_exclude = { "terminal" },
    filetype_exclude = { "help", "dashboard", "NvimTree" },
    char = " ",
    show_trailing_blankline_indent = false,
  }
}

