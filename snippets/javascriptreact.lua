local ls = require("luasnip")
ls.filetype_extend("javascriptreact", { "javascript" })

return {
	-- function component
	ls.parser.parse_snippet(
		{
			trig = "rfc",
		},
		[[
    export ${default} function ${1: NameFunction}() {
      return (
        <p>${1: ...}</p>
      )
    }
    ]]
	),

	-- arrow function component
	ls.parser.parse_snippet(
		{
			trig = "rafce",
		},
		[[
    export const ${1:NameFunction} = () => {
      return (
        <p>${1: ...}</p>
      )
    }
    ]]
	),
}
