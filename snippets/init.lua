local ls = require("luasnip")

-- Share JS snippets with TS
ls.filetype_extend("typescript", { "javascript" })

-- React-JS inherits JS
ls.filetype_extend("javascriptreact", { "javascript" })

-- React-TS inherits JS, TS, and JSX
ls.filetype_extend("typescriptreact", { "javascript", "typescript", "javascriptreact" })
