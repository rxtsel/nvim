local js = dofile(vim.fn.stdpath("config") .. "/snippets/javascript.lua")

local ts_snippets = {
	-- Types
	{ prefix = "int", body = "interface $1 {\n  $0\n}", desc = "Interface" },
	{ prefix = "type", body = "type $1 = $0", desc = "Type alias" },
	{ prefix = "enum", body = "enum $1 {\n  $0\n}", desc = "Enum" },

	-- Generics
	{ prefix = "gen", body = "<$1>", desc = "Generic" },
	{ prefix = "gfn", body = "function $1<$2>($3): $4 {\n  $0\n}", desc = "Generic function" },

	-- Type annotations
	{ prefix = "str", body = "string", desc = "string type" },
	{ prefix = "num", body = "number", desc = "number type" },
	{ prefix = "bool", body = "boolean", desc = "boolean type" },
	{ prefix = "arr", body = "$1[]", desc = "Array type" },
	{ prefix = "rec", body = "Record<$1, $2>", desc = "Record type" },
	{ prefix = "par", body = "Partial<$1>", desc = "Partial type" },
	{ prefix = "req", body = "Required<$1>", desc = "Required type" },
	{ prefix = "pick", body = "Pick<$1, $2>", desc = "Pick type" },
	{ prefix = "omit", body = "Omit<$1, $2>", desc = "Omit type" },

	-- Function with types
	{ prefix = "tfn", body = "function $1($2: $3): $4 {\n  $0\n}", desc = "Typed function" },
	{ prefix = "taf", body = "const $1 = ($2: $3): $4 => {\n  $0\n}", desc = "Typed arrow function" },
}

return vim.list_extend(vim.deepcopy(js), ts_snippets)
