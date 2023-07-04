local ls = require("luasnip")

return {
  ls.parser.parse_snippet({
      trig = "!"
    },
    [[
    <!DOCTYPE html>
    <html lang="${1:es}">
      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${2:Document}</title>
      </head>

      <body>
        $3
      </body>
    </html>
    ]]
  ),
}
