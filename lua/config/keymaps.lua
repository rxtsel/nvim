local discipline = require("config.discipline")
discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x")

-- Delete a word backwardsk
keymap.set("n", "dw", "vb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

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

-- Comma to end
keymap.set("n", "<leader>;;", "$a;<Esc>", { desc = "Insert ; to end line" })
keymap.set("n", "<leader>,,", "$a,<Esc>", { desc = "Insert , to end line" })

-- Silicon
keymap.set("n", "<leader>SS", ":Silicon<Return>", { desc = "[S]creenshot [E]ntire buffer" })
keymap.set("v", "<leader>S", ":Silicon<Return>", { desc = "[S]creenshot selection" })
