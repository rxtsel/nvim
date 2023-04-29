local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("copyright", t("&#169;")),

  s("rxtsel_website", t("https://rxtsel.dev"))
}
