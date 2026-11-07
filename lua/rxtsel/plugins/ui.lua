require("solarized-osaka").setup({
	style = "vivid",
	transparent = true,
})
vim.cmd.colorscheme("solarized-osaka")

local icons = require("mini.icons")
icons.setup({})
icons.mock_nvim_web_devicons()

Rxtsel.tabline.setup()

require("lualine").setup({
	options = {
		theme = "auto",
		globalstatus = true,
		refresh = {
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"FileType",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
				"RecordingEnter",
				"RecordingLeave",
			},
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			Rxtsel.statusline.project_name,
			{ "filetype", icon_only = true },
			Rxtsel.statusline.pretty_path,
		},
		lualine_x = { Rxtsel.statusline.recording, "diagnostics", "diff" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

require("incline").setup({
	window = {
		placement = { horizontal = "right", vertical = "top" },
	},
	hide = { cursorline = true },
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if filename == "" then
			filename = "[No Name]"
		end
		local icon = icons.get("file", filename)
		return { icon .. " ", filename, vim.bo[props.buf].modified and " [+]" or "" }
	end,
})

require("tiny-cmdline").setup({
	position = {
		x = "50%",
		y = "20%",
	},
})
