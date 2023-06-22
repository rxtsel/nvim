local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
  s("copyright", t("&#169;")),

  s("rxtsel_website", t("https://rxtsel.dev")),

  ls.parser.parse_snippet({
      trig = "prettierrc"
    },
    [[
      arrowParens: 'avoid'
      singleQuote: true
      bracketSpacing: true
      endOfLine: 'lf'
      semi: false
      tabWidth: 2
      trailingComma: 'none'
    ]]
  ),

  ls.parser.parse_snippet({
      trig = "eslintrcyml"
    },
    [[
      root: true
      parser: '@typescript-eslint/parser'
      extends:
        - plugin:astro/recommended
      overrides:
        - files:
            - '*.astro'
          parser: astro-eslint-parser
          parserOptions:
            parser: '@typescript-eslint/parser'
            extraFileExtensions:
              - '.astro'
      rules:
        quotes: [error, single]
        semi: [2, never]
  ]]),

  -- css reset
  ls.parser.parse_snippet({
      trig = "cssreset"
    },
    [[
    html {
      box-sizing: border-box;
      font-size: 62.5%;
      scroll-behavior: smooth;
    }

    *,
    *:before,
    *:after {
      box-sizing: inherit;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
      font-size: 1.6rem;
    }
  ]])

}
