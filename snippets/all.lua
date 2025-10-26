local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s({
		trig = "copyright",
		desc = "© HTML entity",
	}, c(1, { t("&#169;"), t("©") })),

	s(
		{ trig = "rxtsel_website", desc = "UTM-tagged rxtsel.dev URL" },
		c(1, {
			t("https://rxtsel.dev/"),
			fmt("https://rxtsel.dev/?utm_source={}&utm_medium={}", { i(1, "source"), i(2, "medium") }),
		})
	),
}
