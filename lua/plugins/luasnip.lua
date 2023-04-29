return {
  "L3MON4D3/LuaSnip",
  version = "<CurrentMajor>.*",
  build = "make install_jsregexp",
  config = function()
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
    ls = require("luasnip")
    s = ls.snippet
    sn = ls.snippet_node
    isn = ls.indent_snippet_node
    t = ls.text_node
    i = ls.insert_node
    fmt = require("luasnip.extras.fmt").fmt
  end,
}
