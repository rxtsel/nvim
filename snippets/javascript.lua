local ls = require("luasnip")

return {
	-- console.log
	ls.parser.parse_snippet({
		trig = "clg",
	}, "console.log(${1: value})"),

	-- import from
	ls.parser.parse_snippet({
		trig = "imp",
	}, "import ${ 1: second } from '${2: first}'"),
}
