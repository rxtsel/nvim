local vault_path = "/mnt/DiskD/rxtsel's vault/"
return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	cmd = "Obsidian",
	enable = false, -- Disable by default, enable it manually if you want to use it.
	event = {
		"BufReadPre " .. vault_path .. "*.md",
		"BufNewFile " .. vault_path .. "*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "rxtsel's vault", -- Name of the workspace
				path = vault_path, -- Path to the notes directory
			},
		},
		completition = {
			blink = true,
		},
		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
			name = "snacks.pick",
		},
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context: follow link, show notes with tag, toggle checkbox, or toggle heading fold
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},
		-- Settings for templates
		templates = {
			subdir = vault_path .. "_templates", -- Subdirectory for templates
			date_format = "%Y-%m-%d-%a", -- Date format for templates
			gtime_format = "%H:%M", -- Time format for templates
			tags = "", -- Default tags for templates
		},
		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end,
	},
	keys = {
		{
			"<leader>On",
			"<cmd>ObsidianNew<CR>",
			desc = "Create new note",
		},
		{
			"<leader>Ot",
			"<cmd>Obsidian new_from_template<CR>",
			desc = "Create new note from template",
		},
		{
			"<leader>Oo",
			"<cmd>ObsidianOpen<CR>",
			desc = "Open in obsidian app",
		},
		{
			"<leader>Ob",
			"<cmd>ObsidianBacklinks<CR>",
			desc = "Show obsidian back links",
		},
		{
			"<leader>Ol",
			"<cmd>ObsidianLinks<CR>",
			desc = "Show obsidian links",
		},
		{
			"<leader>Os",
			"<cmd>ObsidianSearch<CR>",
			desc = "Search obsidian",
		},
		{
			"<leader>Oq",
			"<cmd>ObsidianQuickSwitch<CR>",
			desc = "Quick switch",
		},
	},
}
