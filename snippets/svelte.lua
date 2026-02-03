local js = dofile(vim.fn.stdpath("config") .. "/snippets/javascript.lua")

local svelte_snippets = {
	-- Svelte blocks
	{ prefix = "sif", body = "{#if $1}\n  $0\n{/if}", desc = "Svelte if block" },
	{ prefix = "sife", body = "{#if $1}\n  $2\n{:else}\n  $0\n{/if}", desc = "Svelte if else block" },
	{ prefix = "seach", body = "{#each $1 as $2}\n  $0\n{/each}", desc = "Svelte each block" },
	{ prefix = "seachi", body = "{#each $1 as $2, i}\n  $0\n{/each}", desc = "Svelte each block with index" },
	{
		prefix = "sawait",
		body = "{#await $1}\n  <p>Loading...</p>\n{:then $2}\n  $0\n{:catch error}\n  <p>{error.message}</p>\n{/await}",
		desc = "Svelte await block",
	},
	{ prefix = "skey", body = "{#key $1}\n  $0\n{/key}", desc = "Svelte key block" },

	-- Svelte directives
	{ prefix = "sbind", body = "bind:$1={$0}", desc = "Svelte bind directive" },
	{ prefix = "sclass", body = "class:$1={$0}", desc = "Svelte class directive" },
	{ prefix = "suse", body = "use:$1={$0}", desc = "Svelte action directive" },
	{ prefix = "strans", body = "transition:$1", desc = "Svelte transition" },

	-- Svelte script
	{ prefix = "sscript", body = "<script>\n  $0\n</script>", desc = "Svelte script tag" },
	{ prefix = "sscriptts", body = '<script lang="ts">\n  $0\n</script>', desc = "Svelte script tag (TS)" },

	-- Svelte 5 runes
	{ prefix = "sstate", body = "let $1 = $$state($0)", desc = "$state rune" },
	{ prefix = "sderived", body = "let $1 = $$derived($0)", desc = "$derived rune" },
	{ prefix = "seffect", body = "$$effect(() => {\n  $0\n})", desc = "$effect rune" },
	{ prefix = "sprops", body = "let { $1 } = $$props()", desc = "$props rune" },
}

return vim.list_extend(vim.deepcopy(js), svelte_snippets)
