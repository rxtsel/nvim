return {
	-- Console
	{ prefix = "clg", body = "console.log($0)", desc = "Console log" },
	{ prefix = "cle", body = "console.error($0)", desc = "Console error" },
	{ prefix = "clw", body = "console.warn($0)", desc = "Console warn" },
	{ prefix = "cli", body = "console.info($0)", desc = "Console info" },
	{ prefix = "clt", body = "console.table($0)", desc = "Console table" },

	-- Functions
	{ prefix = "fn", body = "function $1($2) {\n  $0\n}", desc = "Function" },
	{ prefix = "af", body = "const $1 = ($2) => {\n  $0\n}", desc = "Arrow function" },
	{ prefix = "afr", body = "const $1 = ($2) => $0", desc = "Arrow function (return)" },

	-- Async
	{ prefix = "afn", body = "async function $1($2) {\n  $0\n}", desc = "Async function" },
	{ prefix = "aaf", body = "const $1 = async ($2) => {\n  $0\n}", desc = "Async arrow function" },
	{ prefix = "aw", body = "await $0", desc = "Await" },

	-- Control flow
	{ prefix = "if", body = "if ($1) {\n  $0\n}", desc = "If statement" },
	{ prefix = "ife", body = "if ($1) {\n  $2\n} else {\n  $0\n}", desc = "If else" },
	{ prefix = "ter", body = "$1 ? $2 : $0", desc = "Ternary" },
	{ prefix = "try", body = "try {\n  $1\n} catch (error) {\n  $0\n}", desc = "Try catch" },
	{
		prefix = "tryf",
		body = "try {\n  $1\n} catch (error) {\n  $2\n} finally {\n  $0\n}",
		desc = "Try catch finally",
	},

	-- Loops
	{ prefix = "for", body = "for (let i = 0; i < $1; i++) {\n  $0\n}", desc = "For loop" },
	{ prefix = "forof", body = "for (const $1 of $2) {\n  $0\n}", desc = "For of" },
	{ prefix = "forin", body = "for (const $1 in $2) {\n  $0\n}", desc = "For in" },
	{ prefix = "foreach", body = "$1.forEach(($2) => {\n  $0\n})", desc = "forEach" },
	{ prefix = "map", body = "$1.map(($2) => $0)", desc = "map" },
	{ prefix = "filter", body = "$1.filter(($2) => $0)", desc = "filter" },
	{ prefix = "reduce", body = "$1.reduce((acc, $2) => $0, $3)", desc = "reduce" },
	{ prefix = "find", body = "$1.find(($2) => $0)", desc = "find" },

	-- Destructuring
	{ prefix = "dob", body = "const { $0 } = $1", desc = "Destructure object" },
	{ prefix = "dar", body = "const [$0] = $1", desc = "Destructure array" },

	-- Import/Export
	{ prefix = "imd", body = "import $1 from '$0'", desc = "Import default" },
	{ prefix = "imp", body = "import { $0 } from '$1'", desc = "Import destructure" },
	{ prefix = "exp", body = "export $0", desc = "Export" },
	{ prefix = "exd", body = "export default $0", desc = "Export default" },

	-- Promises
	{ prefix = "prom", body = "new Promise((resolve, reject) => {\n  $0\n})", desc = "Promise" },
	{ prefix = "then", body = ".then(($1) => $0)", desc = "then" },
	{ prefix = "catch", body = ".catch((error) => $0)", desc = "catch" },

	-- Objects
	{ prefix = "ob", body = "const $1 = {\n  $0\n}", desc = "Object" },
	{ prefix = "ar", body = "const $1 = [$0]", desc = "Array" },

	-- Misc
	{ prefix = "st", body = "setTimeout(() => {\n  $0\n}, $1)", desc = "setTimeout" },
	{ prefix = "si", body = "setInterval(() => {\n  $0\n}, $1)", desc = "setInterval" },
	{ prefix = "afrom", body = "Array.from($1, ($2) => $0)", desc = "Array.from" },
}
