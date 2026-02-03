return {
	{ prefix = "todo", body = "TODO: $0", desc = "TODO comment" },
	{ prefix = "fixme", body = "FIXME: $0", desc = "FIXME comment" },
	{ prefix = "note", body = "NOTE: $0", desc = "NOTE comment" },
	{ prefix = "hack", body = "HACK: $0", desc = "HACK comment" },
	{
		prefix = "rxtselwebsite",
		body = "https://rxtsel.dev/?utm_source=${1:source}&utm_medium=${0:medium}",
		desc = "rxtsel website URL with UTM tags",
	},
}
