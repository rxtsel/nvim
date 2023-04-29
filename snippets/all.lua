local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("copyright", t("&#169;")),

  s("all_rights_reserved", t("All rights reserved.")),

  s("powered_by", t("Powered by")),

  s("powered_by_link", t("https://rxtsel.dev"))
}
