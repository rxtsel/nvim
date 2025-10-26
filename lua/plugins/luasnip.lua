return {
	"L3MON4D3/LuaSnip",
	-- You can use event = "InsertEnter" or lazy = false to ensure early load.
	event = "InsertEnter",
	build = (not LazyVim.is_win())
			and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
		or nil,
	opts = {
		updateevents = "TextChanged,TextChangedI",
		history = true,
		delete_check_events = "TextChanged",
	},
	config = function(_, opts)
		local ls = require("luasnip")
		ls.config.set_config(opts)

		-- Load inheritance config first
		local init_path = vim.fn.stdpath("config") .. "/snippets/init.lua"
		if vim.loop.fs_stat(init_path) then
			dofile(init_path)
		end

		-- Load all Lua snippets eagerly so extensions are available everywhere
		require("luasnip.loaders.from_lua").load({
			paths = { vim.fn.stdpath("config") .. "/snippets" },
		})

		-- Add virtual text to choice nodes
		local types = require("luasnip.util.types")
		require("luasnip").config.setup({
			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { "●", "DiagnosticVirtualLinesInfo" } },
					},
				},
			},
		})
	end,

	-- Disable friendly-snippets
	dependencies = { { "rafamadriz/friendly-snippets", enabled = false } },
}
