local ts = dofile(vim.fn.stdpath("config") .. "/snippets/typescript.lua")

local astro_snippets = {
	-- Astro components
	{
		prefix = "comp",
		body = "---\ninterface Props {\n  $1\n}\n\nconst { $2 } = Astro.props\n---\n\n<div>\n  $0\n</div>",
		desc = "Astro component with props",
	},

	-- Astro expressions
	{ prefix = "exp", body = "{$0}", desc = "Expression" },
	{ prefix = "map", body = "{$1.map(($2) => (\n  $0\n))}", desc = "Map expression" },

	-- Astro conditionals
	{ prefix = "aif", body = "{$1 && (\n  $0\n)}", desc = "Conditional render" },
	{ prefix = "ater", body = "{$1 ? (\n  $2\n) : (\n  $0\n)}", desc = "Ternary render" },

	-- Astro slots
	{ prefix = "slot", body = "<slot />", desc = "Default slot" },
	{ prefix = "slotn", body = '<slot name="$1" />', desc = "Named slot" },

	-- Astro client directives
	{ prefix = "acl", body = "client:load", desc = "client:load" },
	{ prefix = "aci", body = "client:idle", desc = "client:idle" },
	{ prefix = "acv", body = "client:visible", desc = "client:visible" },
	{ prefix = "acm", body = 'client:media="$1"', desc = "client:media" },
	{ prefix = "aco", body = 'client:only="$1"', desc = "client:only" },

	-- Astro built-ins
	{ prefix = "glob", body = "const $1 = await Astro.glob('$0')", desc = "Astro.glob" },
	{ prefix = "redirect", body = "return Astro.redirect('$0')", desc = "Astro.redirect" },
}

return vim.list_extend(vim.deepcopy(ts), astro_snippets)
