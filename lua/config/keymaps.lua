local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local wk = require("which-key")
local ls = require("luasnip")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwardsk
keymap.set("n", "dw", "vb_d")

-- New tab
keymap.set("n", "te", "<cmd>tabedit<Return>", opts)
keymap.set("n", "<tab>", "<cmd>tabnext<Return>", opts)
keymap.set("n", "<s-tab>", "<cmd>tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", "<cmd>split<Return>", opts)
keymap.set("n", "sv", "<cmd>vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- which-key
wk.add({
	{ "<leader>O", group = "Obsidian" },
	{ "<leader>a", group = "ai" },
})

-- Luasnip choice node navigation
keymap.set({ "i", "s" }, "<C-h>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end)
