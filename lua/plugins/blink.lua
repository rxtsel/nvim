require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust" },
	signature = { enable = true },
	keymap = {
		preset = "default",
		["<Tab>"] = {}, -- Disabled
		["<S-Tab>"] = {}, -- Disabled
		["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
		["<CR>"] = { "select_and_accept", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-b>"] = { "scroll_documentation_down", "fallback" },
		["<C-f>"] = { "scroll_documentation_up", "fallback" },
		["<C-l>"] = { "snippet_forward", "fallback" },
		["<C-h>"] = { "snippet_backward", "fallback" },
		["<C-e>"] = { "hide" },
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "normal",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200
		},
		cmdline = {
			keymap = {
				preset = "inherit",
				["<CR>"] = { "accept_and_enter", "fallback" }
			}
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		}
	}
})

