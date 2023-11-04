local ls = require("luasnip")
ls.filetype_extend("typescriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascriptreact" })

return {
	-- arrow function component
	ls.parser.parse_snippet(
		{
			trig = "rafce",
		},
		[[
    import { FC } from 'react'

    export interface ${1: NameFunction}Props { ${2} }

    export const ${1: NameFunction}:FC<${1: NameFunction}Props> = () => {
      return (
        <p>${1: ...}</p>
      )
    }
    ]]
	),
}
