local ls = require("luasnip")

return {
  -- console.log
  ls.parser.parse_snippet({
      trig = "clg"
    },
    "console.log(${1: value})"
  ),

  -- import from
  ls.parser.parse_snippet({
      trig = "import_from"
    },
    "import ${1: name} from '${2: module}'"
  )
}
