local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
	s({ trig = "clog", desc = "console.log(value);" }, fmt("console.log({});", { i(1, "value") })),

	s(
		{ trig = "import", desc = "import name from 'module'" },
		fmt([[import {} from '{}']], { i(2, "name"), i(1, "module") })
	),
}
