local function select_preserving_file_symlink()
	local oil = require("oil")
	local entry = oil.get_cursor_entry()
	local dir = oil.get_current_dir()

	if entry and dir and entry.type == "link" then
		local path = dir .. entry.name

		if vim.fn.isdirectory(path) == 0 then
			vim.cmd.edit({ args = { path } })
			return
		end
	end

	oil.select()
end

require("oil").setup({
	keymaps = {
		["<CR>"] = {
			callback = select_preserving_file_symlink,
			desc = "Open entry without resolving file symlinks",
		},
	},
})
