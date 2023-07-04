local ls = require("luasnip")
ls.filetype_extend("javascriptreact", { "javascript" })

return {
  -- function component
  ls.parser.parse_snippet({
      trig = "rfc"
    },
    [[
    export function ${1:nameFunction}() {
      return (
        ${2: ...}
      )
    }
    ]]
  ),

  -- arrow function component
  ls.parser.parse_snippet({
      trig = "rafce"
    },
    [[
    export const ${1:nameFunction} = () => {
      return (
        ${2: ...}
      )
    }

    export default ${1:nameFunction};
    ]]
  ),
}
