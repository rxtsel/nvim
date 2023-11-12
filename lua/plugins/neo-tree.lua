return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = true,
		enable_diagnostics = false,
		window = {
			position = "right",
			width = 35,
			mappings = {
				["<esc>"] = "cancel", -- close preview or floating neo-tree window
				["P"] = { "toggle_preview", config = { use_float = true } },
				["s"] = "open_vsplit",
				["t"] = "open_tabnew",
				["C"] = "close_node",
				["z"] = "close_all_nodes",
				["a"] = {
					"add",
					config = {
						show_path = "none", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
				["i"] = "show_file_details",
			},
		},
		default_component_configs = {
			git_status = {
				symbols = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		filesystem = {
			follow_current_file = {
				enable = true,
			},
			hijack_netrw_behavior = "open_current",
			use_libuv_file_watcher = true,
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					"node_modules",
					".git",
				},
				always_show = {
					".env",
				},
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
}
