local ls = require("luasnip")
ls.filetype_extend("typescriptreact", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascriptreact" })

return {
  -- arrow function component
  ls.parser.parse_snippet({
      trig = "rafce"
    },
    [[
    import { FC } from 'react'

    export interface ${1: nameFunction}Props {${2}}

    export const ${1: nameFunction}:FC<${1: nameFunction}Props> = () => {
      return (
        ${3:<></>}
      )
    }

    export default ${1: nameFunction}
    ]]
  )
}
