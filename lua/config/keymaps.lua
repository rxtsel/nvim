-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local wk = require("which-key")

wk.add({
	{ "<leader>O", group = "Obsidian" },
	{ "<leader>a", group = "ai" },
})
