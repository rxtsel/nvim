require("mini.pairs").setup({
	modes = { insert = true, command = true },
})

require("blink.cmp").setup({
	keymap = { preset = "enter" },
	completion = {
		accept = { auto_brackets = { enabled = true } },
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		menu = {
			draw = {
				treesitter = { "lsp" },
				components = {
					kind_icon = {
						text = function(ctx)
							local icon = require("mini.icons").get("lsp", ctx.kind)
							return icon
						end,
						highlight = function(ctx)
							local _, highlight = require("mini.icons").get("lsp", ctx.kind)
							return highlight
						end,
					},
				},
			},
		},
		ghost_text = { enabled = false },
	},
	cmdline = {
		completion = {
			list = { selection = { preselect = false, auto_insert = false } },
			menu = {
				auto_show = function()
					return vim.fn.getcmdtype() == ":"
				end,
			},
			ghost_text = { enabled = false },
		},
	},
	fuzzy = {
		implementation = vim.env.RXTSEL_NVIM_NIX == "1" and "lua" or "prefer_rust_with_warning",
	},
})
