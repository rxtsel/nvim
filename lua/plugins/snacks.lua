return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			sources = {
				explorer = {
					auto_close = true,
					layout = { layout = { position = "right" } },
					hidden = true,
					exclude = {
						"node_modules",
					},
				},
			},
		},
		dashboard = {
			enable = true,
			preset = {
				keys = {
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = " ",
						key = "p",
						desc = "Projects",
						action = ":lua Snacks.dashboard.pick('projects')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					-- Disabled Obsidian options by default, uncomment to enable
					-- {
					-- 	icon = "󰧮 ",
					-- 	key = "o",
					-- 	desc = "New Obsidian note",
					-- 	action = function()
					-- 		vim.cmd("Obsidian new")
					-- 	end,
					-- },
					-- {
					-- 	icon = "󱔘 ",
					-- 	key = "t",
					-- 	desc = "New Obsidian note with template",
					-- 	action = function()
					-- 		vim.cmd("Obsidian new_from_template")
					-- 	end,
					-- },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
██████╗ ██╗  ██╗████████╗███████╗███████╗██╗     
██╔══██╗╚██╗██╔╝╚══██╔══╝██╔════╝██╔════╝██║     
██████╔╝ ╚███╔╝    ██║   ███████╗█████╗  ██║     
██╔══██╗ ██╔██╗    ██║   ╚════██║██╔══╝  ██║     
██║  ██║██╔╝ ██╗   ██║   ███████║███████╗███████╗
╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝╚══════╝
      ]],
			},
		},
	},
}
